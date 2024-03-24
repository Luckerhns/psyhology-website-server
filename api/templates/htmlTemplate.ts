export function htmlTemplate(link: string) {
  return `
        <div>
            <h1>To activate account follow link</h1>
            <a href="${link}">${link}</a>
        </div>
    `;
}