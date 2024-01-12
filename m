Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 948135D90D
	for <phone-devel@vger.kernel.org>; Fri, 12 Jan 2024 10:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="spC2baQ/"
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-5f2d4aaa2fdso66047057b3.1
        for <phone-devel@vger.kernel.org>; Fri, 12 Jan 2024 02:23:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705054991; x=1705659791; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uoixCIvUaJI+Ikw8bVxT8gSbu0EfclZZOnaz2syKKYw=;
        b=spC2baQ/D8jPu7CEJOU1UPOIN16iZNlCsr3QXetR7rqP/O6ARnnDL1eTkw/s90ZqKc
         etq4/kbAXij7fdiNlkjfxpMp/ePmC7Jo3Ukdt+rp/aVLZiXQRJezlSxGNczMGfjq3pzf
         C/9qyekg1pRk7UDFY2CVvMyNCYxhA8Kxgw2w/vGKF+vSebD3LYsUyApejvOfKXWjYf+i
         8yXXBoHbnWy2L4c7PnlGeOU0pWmnVC8sQvYQV4pKV8YPs9Ze3EDOVX16ueew3M9rBbEK
         0aj2F9dx5PYbmTmHxT8qMKJZXejVHszUCn+MFlZQVZ7vmnKGeEBOVRTRJJHKzVbTY1lw
         VB0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705054991; x=1705659791;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uoixCIvUaJI+Ikw8bVxT8gSbu0EfclZZOnaz2syKKYw=;
        b=TjpR/6FUagzDCN+ZldI3Lm6vJuO8yPeVK7xNXFSCoCfZ36PPq4FASgJNGa9h3hsESn
         dt2a6pge7YnQbep7o1XCcBKImqSJJgZXsTruq7myCGgCJa7xikb/bUhGNUko8ZDA5Ane
         +cwqm/hg1ZvjcOOZBLd3RBkjVsmCAh08RtKxB2ApExQY7QmRn+2QTPSU4e+wvnJbxmwX
         yuXnUH4+vaq4Kw/fe933iEjPVy6EdG1N2PD1rWarGMdyFm3BazAf1fB32rxMVOieVpLY
         iAe1SW6r1UbRG004YWpHHrOXGzZ0kyVWKOjAncAbApjye73yugYjBdpZ6A2MzsOdNRDi
         Hh7A==
X-Gm-Message-State: AOJu0YwM+ctQnyK+L2LrT1kbSd7K9gAVtpa4xVYGir2wlB+Vz4xEtnr/
	9m8ZtXWCuXM+SXslmvjdWwnwapxJSVEXjTJsLXUGNdRAYHUd5w==
X-Google-Smtp-Source: AGHT+IHmVOQtBdyVCbejqekjIZT/Rhkl+4ZWZHIRmIXNgIVih5i3KRfprEy8VQeiPbDlnOubwhyA1NG9t/mgb8i6gp4=
X-Received: by 2002:a81:ed0b:0:b0:5ee:6491:c2e5 with SMTP id
 k11-20020a81ed0b000000b005ee6491c2e5mr1005535ywm.10.1705054991639; Fri, 12
 Jan 2024 02:23:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240110-fp4-panel-v2-0-8ad11174f65b@fairphone.com>
 <20240110-fp4-panel-v2-2-8ad11174f65b@fairphone.com> <CACRpkdaWTfPDCin_L6pefHsokjNyO8Mo6hWPdzPLLi1EUkKUuA@mail.gmail.com>
 <CYBZEZ4IM6IL.VR04W7933VI@fairphone.com> <CACRpkdZQbVXfBa70nhDOqfWPbsh-6DgX-uvZOxr19pzMmF2giQ@mail.gmail.com>
 <CYCLSCKPPBOC.1B1MP3VOOC0Q8@fairphone.com> <cdc18e2a-b7eb-4b54-a513-481148fb3b0d@linaro.org>
 <CYCMVXHYVDCI.HVH1TR8MWEUK@fairphone.com>
In-Reply-To: <CYCMVXHYVDCI.HVH1TR8MWEUK@fairphone.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 12 Jan 2024 11:23:00 +0100
Message-ID: <CACRpkdacS9ojXUuogygkz6xxCf3mMq6GG_75sze8ukUu=rxVyw@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] drm/panel: Add driver for DJN HX83112A LCD panel
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: neil.armstrong@linaro.org, Jessica Zhang <quic_jesszhan@quicinc.com>, 
	Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, ~postmarketos/upstreaming@lists.sr.ht, 
	phone-devel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 12, 2024 at 10:52=E2=80=AFAM Luca Weiss <luca.weiss@fairphone.c=
om> wrote:

> Since there's zero indication Truly is involved in this panel in my
> documentation - much less the number 5P65 - I'm not going to add that.

OK then, I fold, thanks for looking into it.
Keep the Himax hx83112a file name and symbols.

> So in short this panel is the model 9A-3R063-1102B from DJN, which uses
> a Himax HX83112A driver IC.

So compatible =3D "djn,9a-3r063-1102b" since the setup sequences for
hx83112a are clearly for this one display?

Yours,
Linus Walleij
