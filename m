Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB2DE377541
	for <phone-devel@vger.kernel.org>; Wed, 16 Sep 2026 16:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789576850; cv=none; b=SE2ww94jgM8ngc8/spo1uPTZythEhWBgFlKlrnT6mwFJx8G6xDjjJSOZpGS/Ze1GTIDrVT/B3juqAhXvnwxd82j0zKlLru0cFJQGmbZglbYZkidTEdb5Lh9aLwR7Hpl/+YIwLQf3owYHXGmxFnkv/UtEJZ0QL3o7mbOwjRifBz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789576850; c=relaxed/simple;
	bh=NMD7vBQ6RWs/J5cNo+VFCsSkxyb2apVp1B4H98H0FXc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PSoTUt8cYF8HYPDi+wTcLONrDLbomKmPE8n+5sGrfz2zNfn8hDKGvVb7NerTX6TbhNKjcutd/EIcQMvs7UDh0z9td6eOOBiwQLCkkBlYVDlAEaiPm0mZSHz4YiWhGnR3l2X4vE38Grkr+Q3JJFZ8zL6ARupmHkj32aGeYd4O6+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TKsIZmoj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TKsIZmoj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CC561F008A4
	for <phone-devel@vger.kernel.org>; Wed, 16 Sep 2026 16:40:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789576828;
	bh=NMD7vBQ6RWs/J5cNo+VFCsSkxyb2apVp1B4H98H0FXc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=TKsIZmojAOCZjVkuTEgu/Ojwjhf036GzQdXroxfypwiDNIxHQWqBjvK0vOkxCSOvf
	 SDTolr2qG/vfhUXo0swwfHYpn9E8Z47GZVBKvuDxpwgQ1cXXuQh9Fh877873KVTmzB
	 XQyqW0MAgfIvsHXGLckUqVpptBkk31pAt/Q9KMAu02W9Fvi9xEodCxZPsLnbYp+k8+
	 n+6cOLyimrkEwcaLHYCw4WMeswPWzpUp5oX0knNETQuVaKKQ8xoaEsU1O1qy2GNzPg
	 aR+ez/vPscABS5AEn7M4qruHiurIohb0SFlk4+C07AlCWDYM088WL3whOU8RqNtLXx
	 JMVjqi15NNTfQ==
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b5e4f1801fso1310766e87.2
        for <phone-devel@vger.kernel.org>; Wed, 16 Sep 2026 09:40:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwQdu+2KkotJlCBbYkJq3ttyxVxdNkqAXk/odvWrTDqd0oG0rKy5pn5jYfcmXvGUWIzhvAIJo11PWrRiA==@vger.kernel.org
X-Gm-Message-State: AFuF++nZ4oLQpQyXWka9PyzgksMhPVUE5OIITwiW55KyCw9OyC3NpFH3
	HliwQtDUJkogfSWSuMgtOlO8x7KARBlI/IqtfM1b/6BW8f44rSzlDIZJDiPN5q6ai26hOVyDAEZ
	7g6AiChIu2D6YFgAlutjzWUIaDoK6SE0=
X-Received: by 2002:a05:6512:1107:b0:5b4:a836:13fd with SMTP id
 2adb3069b0e04-5b8b661e3a7mr897834e87.22.1789576826773; Wed, 16 Sep 2026
 09:40:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260908-ebbg-ft8719-fixups-v2-0-5454ae1f5581@ixit.cz>
In-Reply-To: <20260908-ebbg-ft8719-fixups-v2-0-5454ae1f5581@ixit.cz>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 16 Sep 2026 18:40:12 +0200
X-Gmail-Original-Message-ID: <CAD++jLkQw-U=e43K7Zjdawid5D54hoQFAkVLBLmOsq00FGOoAg@mail.gmail.com>
X-Gm-Features: AcwNN1WRdUJu-Cn8nI0om7fEFyccuBINdekovMd8_4ronkacx1OYdjXuVXiord8
Message-ID: <CAD++jLkQw-U=e43K7Zjdawid5D54hoQFAkVLBLmOsq00FGOoAg@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] Xiaomi Poco F1 (ebbg display variant) fixes
To: david@ixit.cz
Cc: Joel Selvaraj <foss@joelselvaraj.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Jessica Zhang <jesszhan0024@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Sam Ravnborg <sam@ravnborg.org>, Marco Mattiolo <marco.mattiolo@hotmail.it>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	phone-devel@vger.kernel.org, Casey Connolly <casey.connolly@linaro.org>, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 8, 2026 at 2:45=E2=80=AFPM David Heidelberg via B4 Relay
<devnull+david.ixit.cz@kernel.org> wrote:

> Been broken in mainline for some time.
>
> Signed-off-by: David Heidelberg <david@ixit.cz>

Looks good to me:
Reviewed-by: Linus Walleij <linusw@kernel.org>

Or should I simply apply it for fixes?

Yours,
Linus Walleij
