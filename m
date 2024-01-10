Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7840E3FB36
	for <phone-devel@vger.kernel.org>; Wed, 10 Jan 2024 11:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="IVNTihcm"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-55719cdc0e1so4502815a12.1
        for <phone-devel@vger.kernel.org>; Wed, 10 Jan 2024 03:00:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1704884424; x=1705489224; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ONi/SB9nLqgwdclaMN3RyBOpRG19jO44sGJgFACT67g=;
        b=IVNTihcm+vRSs/l7RJQ/Ty7O8XdgPaIZUKJnF8cpWhci6F2+kNMWB9wr4LcNEhMD+y
         BzhqC4OPpyFUzKzKJz4efIWl1sb3Jrq6wcV6r8zRt6gLxvSjSt6iHF/2frpuQQAjBnOY
         ILmj/85CJzSlER353HH9qJKo1bBKOaf4O4S70Hh4hwLjCJdBgJ4XU1G2N1akMkFQoT1N
         BIO/Wyc+qW0SsVh4ajxTm1Quc74ZpiH/KLA/o64NiDgvZk1cCrE1cZxUV8EanZrmD+ve
         CBFP+hYWWqSWYDzWBVCSIwXPx+WBV+HXEDh7Crzhrd7sHNlXrG1Ev2locE/XDCGSE5YC
         FkWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704884424; x=1705489224;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ONi/SB9nLqgwdclaMN3RyBOpRG19jO44sGJgFACT67g=;
        b=vhI8RdOpKkXv0RNrLmXZ5TWcu1eEF/mbkvkg9Q7Z7lS1LSaFxnNN9jyqUAUzZdHdvh
         3tZuUESL4Drh9kaOXIk/+3s0Pq8BmWXYA7VnLw9WHjZxjRbCg7t1mRDwxJdMq3el/S0l
         2nXzdSF9s2Bo/gBSMccNtRIo/b2mmUMMVScdiGYfaT57K9fi/dKMy7Z4H2EnOmRpPkXf
         hDcxG2v56cO1jwdetfjjLpFMW2imP1a39bZXgY0yUvchm22nqkt97tf9PTVN09+ES4MA
         zUXuzEEjHCV9jabfWVPpkx55soG7jV5LSj8CsujgKIaMt1o2VR9y6lFoJ4iTsPLUNHxi
         4Yzw==
X-Gm-Message-State: AOJu0YwArDPWhSLIJc+gdWSEHhED5PtdHYArncQ0a5Z2XC7LHkwa4bvx
	T3jHrndNdeXLFtmtUtRC+FLKuNQq1IusyA==
X-Google-Smtp-Source: AGHT+IF5G3ti7drOafPhH/oJnH4OEjkohZU5G6wl1Gh/kLq1Rluh5+3uo+b16GQfeNr7IUyy5r+CMw==
X-Received: by 2002:a17:907:9017:b0:a28:e3b6:ae4a with SMTP id ay23-20020a170907901700b00a28e3b6ae4amr400415ejc.57.1704884423732;
        Wed, 10 Jan 2024 03:00:23 -0800 (PST)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id lh13-20020a170906f8cd00b00a2bd425eab2sm464326ejb.2.2024.01.10.03.00.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jan 2024 03:00:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 10 Jan 2024 12:00:23 +0100
Message-Id: <CYAZ37LBKG4E.2096GKVUXN8Y2@fairphone.com>
Cc: <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sm7225-fairphone-fp4: Enable
 display and GPU
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Konrad Dybcio" <konrad.dybcio@linaro.org>, "Neil Armstrong"
 <neil.armstrong@linaro.org>, "Jessica Zhang" <quic_jesszhan@quicinc.com>,
 "Sam Ravnborg" <sam@ravnborg.org>, "David Airlie" <airlied@gmail.com>,
 "Daniel Vetter" <daniel@ffwll.ch>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "Rob Herring"
 <robh+dt@kernel.org>, "Krzysztof Kozlowski"
 <krzysztof.kozlowski+dt@linaro.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Bjorn Andersson" <andersson@kernel.org>
X-Mailer: aerc 0.15.2
References: <20240105-fp4-panel-v1-0-1afbabc55276@fairphone.com>
 <20240105-fp4-panel-v1-3-1afbabc55276@fairphone.com>
 <3fdc6e74-d817-4341-bf64-9096608990d6@linaro.org>
In-Reply-To: <3fdc6e74-d817-4341-bf64-9096608990d6@linaro.org>

On Wed Jan 10, 2024 at 11:58 AM CET, Konrad Dybcio wrote:
>
>
> On 1/5/24 15:29, Luca Weiss wrote:
> > Add the description for the display panel found on this phone and remov=
e
> > the simple-framebuffer that was in place until now
>
> Why? They should be able to coexist with a smooth-ish handoff

Does that work upstream? I'm aware that downstream can do this but
thought this was still missing upstream.

Didn't check what happens when you have both enabled.

>
> [...]
>
> >  =20
> > +&gmu {
> > +	status =3D "okay";
>
> Please kick the disablement from the SoC dtsi instead, it won't
> probe without the GPU being enabled

Ack, will include a patch in v2 for that.

>
> Konrad

