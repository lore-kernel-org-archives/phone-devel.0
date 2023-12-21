Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 198C014A8B
	for <phone-devel@vger.kernel.org>; Thu, 21 Dec 2023 07:33:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="z6eef2g4"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a2335397e64so52056366b.2
        for <phone-devel@vger.kernel.org>; Wed, 20 Dec 2023 23:33:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1703143989; x=1703748789; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/0VpDqqUIzOlKBhn2gCRz1W1Bf+NVsRHUpuRi9T9QvI=;
        b=z6eef2g4EqmeXmxruoboMdtYIIFX7jty01jJp5XKrkyR4TFwFjSIN7HHR+QzwjjxYc
         +dlYrwtyRhdZncCygQ5jmyJ+bhICblx1+Snz72UOCRywXqCmpiJIELkZhxP6KIyqmZ9X
         X0Y3GOYccegVkSvgE9u5muEaNB4N5Zo6L/PDlIXH/F1tt0UqlIb4tMD7Q4Ki+1mNsA/j
         6vcK+MN8ZR8Zq0F+9ORtg1hqDgV9tkPqBbv8VwnZXoaIu53S3MCbpodN91e2zQp/gkd2
         6kIJgmpwrir/b1DBfNK967xY4hH1xVTpmOMWDi8SK/esDgndy/xpyDBUMQIuP6031Xk4
         oF4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703143989; x=1703748789;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/0VpDqqUIzOlKBhn2gCRz1W1Bf+NVsRHUpuRi9T9QvI=;
        b=TvNfpZIlS2rIpETdztSa51ZQjy2YXOlFWrJBQ7GGEW4h4Sk2Zu7aZJmKYCQIuSnMJ6
         Irv2nlsZ17PLzxdkTJeYtnExZJ17i/ho01jYYmXxSDJdzuPbWT4QEe8tE42Gxg70fD0X
         GdX4e7RtIF15DU+pZZLxUeKL/tDIa18Q/J08hbC5t+A/tp6uTvhJF9JGK+Ng7huTPMaY
         H2l1GjW6egrdlazbt2/vDpFf9xXyJNNsdjiwMj2NZamhP/Zr+9/3PDIBzUdGFbyUxZgi
         lsTc89hF9fn3x0vqxTBQO7JaVgAM540vgEYihhcsJVsJ9l7EW2CjAxx0p8jkNXm4b6KG
         Vp9g==
X-Gm-Message-State: AOJu0YzKCG9LE0YXmvKqhX48QHIh6e8lpEI+Ych7am+ZBxbeJZdePiHu
	Jj2P5mNuNr0StyalGANYUStsmg==
X-Google-Smtp-Source: AGHT+IH0oytZXCEplX5mnIjMU1XTUB7KsqnPxyVQVbzXWE5l7gbKRZ2BZnW985lnddzue73LNbDOQA==
X-Received: by 2002:a17:906:f5a3:b0:a1f:5c21:a577 with SMTP id cm35-20020a170906f5a300b00a1f5c21a577mr12532478ejd.152.1703143989091;
        Wed, 20 Dec 2023 23:33:09 -0800 (PST)
Received: from localhost (2a02-8388-6584-6400-d322-7350-96d2-429d.cable.dynamic.v6.surfer.at. [2a02:8388:6584:6400:d322:7350:96d2:429d])
        by smtp.gmail.com with ESMTPSA id wh14-20020a170906fd0e00b00a233efe6aa7sm641391ejb.51.2023.12.20.23.33.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Dec 2023 23:33:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 21 Dec 2023 08:33:07 +0100
Message-Id: <CXTU5MLN0YDS.29PPV8KZF8G9R@fairphone.com>
Cc: <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-usb@vger.kernel.org>
Subject: Re: [PATCH 0/3] Fairphone 5 PMIC-GLINK support (USB-C, charger,
 fuel gauge)
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Konrad Dybcio" <konrad.dybcio@linaro.org>, "Bjorn Andersson"
 <andersson@kernel.org>, "Rob Herring" <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, "Conor Dooley"
 <conor+dt@kernel.org>, "Heikki Krogerus" <heikki.krogerus@linux.intel.com>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 <cros-qcom-dts-watchers@chromium.org>, "Dmitry Baryshkov"
 <dmitry.baryshkov@linaro.org>
X-Mailer: aerc 0.15.2
References: <20231220-fp5-pmic-glink-v1-0-2a1f8e3c661c@fairphone.com>
 <8d042095-1e09-45cc-9762-909fe8d663a9@linaro.org>
In-Reply-To: <8d042095-1e09-45cc-9762-909fe8d663a9@linaro.org>

On Wed Dec 20, 2023 at 1:32 PM CET, Konrad Dybcio wrote:
> On 20.12.2023 11:02, Luca Weiss wrote:
> > This series adds all the necessary bits to enable USB-C role switching,
> > charger and fuel gauge (all via pmic-glink) on Fairphone 5.
> >=20
> > One thing that could be made different is the pmic-glink compatible.
> > I've chosen to use qcm6490 compatible for it and not sc7280 since
> > there's plenty of firmware variety on sc7280-based platforms and they
> > might require different quirks in the future, so limit this PDOS quirk
> > to just qcm6490 for now.
> >=20
> > If someone thinks it should be qcom,sc7280-pmic-glink, please let me
> > know :)
> IMO it's best to continue using the "base soc" (which just so happened
> to fall onto sc7280 this time around) for all compatibles, unless the
> derivatives actually had changes

Hi Konrad,

I think at some point I asked Dmitry what he thought and he mentioned
qcm6490. Even found the message again:

> well, since it is a firmware thing, you might want to emphasise that.
> So from my POV qcm6490 makes more sense

But yeah since it's likely that sc7280 firmware behaves the same as
qcm6490 firmware it's probably okay to use sc7280 compatible, worst case
we change it later :) I'll send a v2 with those changes.

Regards
Luca

>
> as far as firmware goes, I *think* CrOS doesn't even have PMIC_GLINK?
> There are however WoA 7280 laptops which totally should have it.. Would
> be nice to hunt some down and see if they report different stuff to
> what's there on android firmware
>
> Konrad

