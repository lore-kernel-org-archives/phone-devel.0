Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D33A2217677
	for <phone-devel@vger.kernel.org>; Fri, 25 Apr 2025 20:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745614068; cv=none; b=cFfEdWmrR3FRdgwDlsDuOa8OgDlMZGJzW1aQ8Z+hTWW8YC00YJkgRTXwGimMGtfVFL06JGhrD7rzm7YOLoLc5C/+p7eOZKKySu0P7ThmcUugZpuXELtUquaqO2wPZ49t8I4v4tu3iXKDJCx9bfibx8tPdRLvXHd4aS7LxuIHYsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745614068; c=relaxed/simple;
	bh=Ons6fbZ/ZBBSkZ0lCnRlE60mRw4vXN50ao9l15AnCic=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=FjjdihN1i60XU18E9V/+HHqAsvDp2dA57Tt7ZVEfSW2EGk7mC/sX0//GP1UwF5G6S0v0eve3DjVGO6QTyAwrj4kUHC9ESShAevigvsqo5sCbBd8bmpH6SSiTWAQR7Xd9/so+F76YQ1Hup04BRhFCmbTe4zOZ1Py6XD6ArT3dBlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=iobspATP; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="iobspATP"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-39141ffa9fcso3020711f8f.0
        for <phone-devel@vger.kernel.org>; Fri, 25 Apr 2025 13:47:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1745614064; x=1746218864; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ons6fbZ/ZBBSkZ0lCnRlE60mRw4vXN50ao9l15AnCic=;
        b=iobspATPfwGqIsLM0hRdkX27+Vqee4L0hK2wogylTQQQC9L+KpXhkA5f+ufUH071k7
         qgJ+/c36AdNxZ+cdMkrDE9ooQA33mTTGNqt5WcH+Wc0yI1bLLLdPvR+8RR6eE1ja1h5I
         W+H7D/iIG+hff2pOE3PUh+2sGH4wo8EgNreZyL7jTb0xgL8hP3WvmQtCOV+5Cr7fqU3u
         //Ki43jNqsfiXc/67oMwWU2xrQT6OPXwdPjTt8pMf80P5yrLIVscYTBJuGsgYEuvpEai
         JKUXTf30k4vhbfxVbdV4in6mRewfa6G5fUDWy6ptcbwej9NsfGrL2C6+unNLWv4pTE9M
         HrPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745614064; x=1746218864;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ons6fbZ/ZBBSkZ0lCnRlE60mRw4vXN50ao9l15AnCic=;
        b=NO2MMbbXCVM+4SF2/I4ia2xLa5WxdPG+6NHuAlb9kzs9Vr/k+YlcSv1RndQ/Rv0AQA
         r5VlNDKXjFWXAA2Zqj8VPnC3OmX+aT5anLwsxkjZoI9SKkI0GRsq+yKGp5Z+Xrzl9jPu
         KaOBtVVpulkN8oNMqar7WMLaRnqxUEdZp7wUBiw+U29PBg1owGR+ZlhHjv0EAuGyMz71
         SZeqEkOx47b6urcxR0hGcrKjB6GoJXR0/UewYT16vgmyxMNdlczlS8XOjZk8HddkWuj5
         JEIaG9RC+LdArEa4bjQ8QOvheW2InltBYXDfjmv/F8Ph/C6LpBMTtrdbe+swbZr6dof/
         +S2A==
X-Forwarded-Encrypted: i=1; AJvYcCUkEGsnO69u38P7vQAJf4kv3kW0bje/cXAUNbhgals0X6ZicS64He44dsxuC7Vsd0vfy42x9nVOuQC8Pg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxhT7aSgi2Z14nb66HgQZyOrNxtY4h1zRczlukoewqTR6LrUYCm
	d/T9PPY0cEbv9i6WAAvdv0cJqUVj0RrugV9QCLjmZXbQDu89bUXLdLNOUpUkqyA=
X-Gm-Gg: ASbGnctbQfI0gSSuYb45pxXXUzamZ9IZdfYa3QF88fXJIdpolCWba0ovSY6cEzHfV1u
	Y2z2uIejFCSjEEn4PySCvKrHAAIepKozOubw+A1aN4XhoRqs1e2q+AyNugzjG7mj4vLVDKeVq3Z
	EyO+x9TInZ3uGMeKIMjyff3XDlOc/TKYdgOHEydqFdFEM8nrBvZFwDqBiYzZbFPPDyWblprxRR6
	iBzsMEd7q7of2fEWUAioA+GtLIZijh9JsbvpuWvXhhi1RHye9iJsPYok69t6fKKlQSHudqoy60K
	BTyxDnynt1bum6yhI9eQxSLDGM4bxYUIsPvaUDuDI3tvZ0rahlMa0dQB155cIZFw/g7OicnPYgl
	uoo7NHYTy8MuGJsaGcq2J76IkuDOB8XKsQH0enHAGnanwiHM9O0ZN
X-Google-Smtp-Source: AGHT+IHc2IGV1cabuJnO+f6tRyRq8tFSNKSMn/0EAuS9gCgWsxP2W699M+Xi8my9zfWANmox2FyRWg==
X-Received: by 2002:a05:6000:18a8:b0:39f:a553:3d98 with SMTP id ffacd0b85a97d-3a074f89292mr3119425f8f.56.1745614064100;
        Fri, 25 Apr 2025 13:47:44 -0700 (PDT)
Received: from localhost (2a02-8388-6584-6400-d322-7350-96d2-429d.cable.dynamic.v6.surfer.at. [2a02:8388:6584:6400:d322:7350:96d2:429d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073e5da0dsm3245891f8f.88.2025.04.25.13.47.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Apr 2025 13:47:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 25 Apr 2025 22:47:42 +0200
Message-Id: <D9G0JHKZ0RXB.3LI5UGS7QTVQN@fairphone.com>
Cc: "Srinivas Kandagatla" <srini@kernel.org>, "Banajit Goswami"
 <bgoswami@quicinc.com>, "Liam Girdwood" <lgirdwood@gmail.com>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Jaroslav Kysela" <perex@perex.cz>,
 "Takashi Iwai" <tiwai@suse.com>, "Bjorn Andersson" <andersson@kernel.org>,
 "Konrad Dybcio" <konradybcio@kernel.org>,
 <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <alsa-devel@alsa-project.org>, <linux-arm-msm@vger.kernel.org>,
 <linux-sound@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, "Dmitry Baryshkov"
 <dmitry.baryshkov@oss.qualcomm.com>, "Neil Armstrong"
 <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3 2/5] ASoC: qcom: sm8250: set card driver name from
 match data
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Mark Brown" <broonie@kernel.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250425-fp5-dp-sound-v3-0-7cb45180091b@fairphone.com>
 <20250425-fp5-dp-sound-v3-2-7cb45180091b@fairphone.com>
 <36904d64-68e1-43b2-baed-50b5fddc2bcb@sirena.org.uk>
 <D9FXE4TJ23QB.1CS3D6PU2FGMR@fairphone.com>
 <ccca5e19-5a4e-423b-923e-ea0de6682752@sirena.org.uk>
In-Reply-To: <ccca5e19-5a4e-423b-923e-ea0de6682752@sirena.org.uk>

On Fri Apr 25, 2025 at 9:03 PM CEST, Mark Brown wrote:
> On Fri, Apr 25, 2025 at 08:19:39PM +0200, Luca Weiss wrote:
>
>> I've based this series on next-20250417 tag, so this is probably due to
>> the changes from the USB sound offloading series that Greg has picked
>> up.
>
>> So either Greg also picks up these changes when they're ready, or we
>> wait until 6.17?
>
> Or base it on my tree and let things get sorted in the merge, I don't
> know what the conflicts might be?

For this patch here it might be okay but patch 3/5 from this series very
much depends on the patch in Greg's tree, given it refactors/expands on
the USB_RX if there. Resolving this through merge wouldn't be very
pretty.

Regards
Luca
