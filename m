Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A80049F13D
	for <phone-devel@vger.kernel.org>; Thu,  1 Oct 2026 12:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790856547; cv=none; b=HZqO+xG8G08ynxcDOnGaix/d4LcxwTClH5ulQNyJ0X8W/b3hVKXCdLNflDPKJu/wT44a5poIo5RM6qOkTw9MIcATiyl4/tj9A6vIcW/MuYtQHU0K1WXHK5zojQBolHSGAvWFJHIvAFq8vVXn8ycBaITV8eSvFP8B5W0JVpzm8SY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790856547; c=relaxed/simple;
	bh=Efy2GeD05EfphIFlVWVsMtlBk1ymm+KYQ4arEyy8BdA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Yv01R+lCqA1Q1buSDASk78VTmQoYDaEVzRKT0TQBa4b24g/FCBPPLIm+Ncg2csyRqJQ82Un6WEKk1gYuya0AS5qAvzHfyhnFLnPCNqRVJKc2b8hqjGlRR2zXSPmf4/JSYw7YYIFZSYKWhj0nAEeHZMRrM0jp7y6PTKRYxCBEzlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jFuxNW7m; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jFuxNW7m"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8C7A1F00899
	for <phone-devel@vger.kernel.org>; Thu,  1 Oct 2026 12:08:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790856530;
	bh=Efy2GeD05EfphIFlVWVsMtlBk1ymm+KYQ4arEyy8BdA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=jFuxNW7mZ6qbHWx10RpXY9VNIRo4YZY2IZO+QYiVSPtGw0ROAJE0HCnGRCXFPMs82
	 vdPe+j6DjROF9Xhzx3kcKTcR9jVUXE0WLj5JNDWaU9IqtI4JmsSTPApfuwRbp0FEI5
	 OxGSK1shFcVAlFD3IMwK9ktrLibYGUFV/CmxWTanATzan5kRr1W46mtgGKPbg2f8ez
	 MD7iDcGg5ZeR06dEa1ngOCbJ1YAZ3sL5g49Ks0lMioEN1T4iCen72sANcOGa2C4Y5R
	 IcH28i0lmwQWnAwGirOTo0bJOkv3bmQ47J99vL8084ix7NQJe44onCLJ/c2NtV1ZM8
	 JDgOHDrKPWqZQ==
Received: by mail-oo2-f35.google.com with SMTP id 006d021491bc7-6dd7916ae34so607122eaf.2
        for <phone-devel@vger.kernel.org>; Thu, 01 Oct 2026 05:08:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwOH/jbIUcfj+b0AzaEh2uD5OW6/wSw+G/XsazFeEtVp1SDR8hwExQVmBDe9G/fjZ1HCmK6raFSQwL+WA==@vger.kernel.org
X-Gm-Message-State: AFuF++mRUouDTihwTu52xit3Ee+Ctjx+toUBFr4r0RlGpfhiowMXcjDm
	ZbUb84P7cbDnfMFcGrgHqzxKFaaQXFqM8w5G6LWFjiU8+30sOWYNx4DTxmVPG7Z5JOyXaUMfLkT
	hV813uhc1ya25pstjGro/Dt6NRhSeCS8=
X-Received: by 2002:a05:6820:709a:10b0:6dd:fdda:290b with SMTP id
 006d021491bc7-6ddfdda4299mr1394070eaf.57.1790856530140; Thu, 01 Oct 2026
 05:08:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260908-ebbg-ft8719-fixups-v2-0-5454ae1f5581@ixit.cz> <20260908-ebbg-ft8719-fixups-v2-3-5454ae1f5581@ixit.cz>
In-Reply-To: <20260908-ebbg-ft8719-fixups-v2-3-5454ae1f5581@ixit.cz>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 1 Oct 2026 14:08:35 +0200
X-Gmail-Original-Message-ID: <CAD++jL=KPyt384bEcrTR1V6y4WH3Nkz6w7rsVxZUjnJZc6_uTQ@mail.gmail.com>
X-Gm-Features: AclHuK-CfO2vaNrbhnpcNDH7OQiVrROdFcvCpCkNzNhxCoBuSHJS-Mb8OG4p1GY
Message-ID: <CAD++jL=KPyt384bEcrTR1V6y4WH3Nkz6w7rsVxZUjnJZc6_uTQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] drm/panel: ebbg-ft8719: Split initialization into
 enable/disable fn
To: david@ixit.cz
Cc: Joel Selvaraj <foss@joelselvaraj.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Jessica Zhang <jesszhan0024@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Sam Ravnborg <sam@ravnborg.org>, Marco Mattiolo <marco.mattiolo@hotmail.it>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	phone-devel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 8, 2026 at 2:45=E2=80=AFPM David Heidelberg via B4 Relay
<devnull+david.ixit.cz@kernel.org> wrote:

> From: David Heidelberg <david@ixit.cz>
>
> Move the MIPI commands into enable/disable callbacks since they
> are called between prepare/unprepare callbacks.
>
> Signed-off-by: David Heidelberg <david@ixit.cz>

LGTM
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
