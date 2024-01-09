Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2CCB36B02
	for <phone-devel@vger.kernel.org>; Tue,  9 Jan 2024 11:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="ZNlEBOe/"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a28b2e1a13fso290139466b.3
        for <phone-devel@vger.kernel.org>; Tue, 09 Jan 2024 03:24:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1704799497; x=1705404297; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X66BiEuJEgHo+gMcUmnTpOb7VGeAdI8Ticc89hW7dUM=;
        b=ZNlEBOe/S5RZU85KZYGnxlmzGdEqUcxk5zFVG2uJ7Uzj8U0FwzIazxz2Uta3GnyKkM
         CPzybDvBnLYqGiLvL+yrKfdgKaf9ezqcZPw0fodjlwNcn7xVfSaUSstCsUvYVJeeyzQs
         WeLduJSJQPaiWcLCaBZhQQouo7vDRFIiLaxJDUGOL5HIqYYejJGXC31QELDDZC4PDgGr
         VYfcg7yz0f657WUXaAcXI5bQeyvNgEESEscpU7sAghvqndh65trbicU6XfjST/N9j0Ec
         WJM0OgbYpVkkasIA132Nwwbithug64EhU6ctrkXtleXjlUl73t5cyFdagrY1dH8N774g
         K0og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704799497; x=1705404297;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=X66BiEuJEgHo+gMcUmnTpOb7VGeAdI8Ticc89hW7dUM=;
        b=o2uCer7Hh6Sx9+GH19Yl1bJ7i8vdn/ysIXliEw/9qI9JogrApCou/unVFXXcgyMeq2
         qELs1hWNQKAz85CoHn5f/HN6TmxCchaFeHC5RuYwJNMt/07lx1YU8+/d1Px6Zr9WKtOP
         HUjuVUHx0H+0vQmzvF4EmuCZ4xfcTr6qN9yo0HAIyInagYGgbAqF1kd88fMeeMKe3NGS
         AaR2DH5V1gqCT+f2zvClMhWdQHhkpIVp6fzp5ucXEk3Y1z9PMGvw/DIGLZCh/bmDvntH
         CdvRu9/NVPc9qLWs2SB7SGglJtG4T4+PRXb9Gb2FMKKjItwuZrX/YtNuoFh2WXhnBOPL
         fNyQ==
X-Gm-Message-State: AOJu0YxUeezoOscPheHjUN6ar9tlF7zOW9OKKa9cUTSMFIHHtgNDxNz9
	yNqlbD5GEKnmMwbX2PvCbBhFE82PlfuRVgPYZwrVOhGQfCNhvg==
X-Google-Smtp-Source: AGHT+IFQH3ZBab+5v99Ep/opDSM5xrNCAF7LpV2l3rddp8xmaKOcXLRQTR68sqhf8Ph0GBXdXu8a9Q==
X-Received: by 2002:a17:906:412:b0:a28:fd70:1a1d with SMTP id d18-20020a170906041200b00a28fd701a1dmr476597eja.78.1704799496813;
        Tue, 09 Jan 2024 03:24:56 -0800 (PST)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id l25-20020a1709061c5900b00a28956cf75esm927657ejg.130.2024.01.09.03.24.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jan 2024 03:24:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 09 Jan 2024 12:24:56 +0100
Message-Id: <CYA4ZGOQOJXY.2RO98RBCDKK5J@fairphone.com>
Cc: <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sm7225-fairphone-fp4: Add PM6150L
 thermals
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Konrad Dybcio" <konrad.dybcio@linaro.org>, "Bjorn Andersson"
 <andersson@kernel.org>, "Rob Herring" <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, "Conor Dooley"
 <conor+dt@kernel.org>
X-Mailer: aerc 0.15.2
References: <20240105-fp4-thermals-v1-0-f95875a536b7@fairphone.com>
 <20240105-fp4-thermals-v1-2-f95875a536b7@fairphone.com>
 <18dc5f88-6590-4e2d-948f-fd77f4713f8b@linaro.org>
In-Reply-To: <18dc5f88-6590-4e2d-948f-fd77f4713f8b@linaro.org>

On Tue Jan 9, 2024 at 11:09 AM CET, Konrad Dybcio wrote:
>
>
> On 1/5/24 15:54, Luca Weiss wrote:
> > Configure the thermals for the PA_THERM1, MSM_THERM, PA_THERM0,
> > RFC_CAM_THERM, CAM_FLASH_THERM and QUIET_THERM thermistors connected to
> > PM6150L.
> >=20
> > Due to hardware constraints we can only register 4 zones with
> > pm6150l_adc_tm, the other 2 we can register via generic-adc-thermal.
>
> Ugh.. so the ADC can support more inputs than the ADC_TM that was
> designed to ship alongside it can?
>
> And that's why the "generic-adc-thermal"-provided zones need to
> be polled?

This part of the code from qcom-spmi-adc-tm5.c was trigerring if I
define more than 4 channels, and looking at downstream I can also see
that only 4 zones are registered properly with adc_tm, the rest is
registered with "qcom,adc-tm5-iio" which skips from what I could tell
basically all the HW bits and only registering the thermal zone.


	ret =3D adc_tm5_read(chip, ADC_TM5_NUM_BTM,
			   &channels_available, sizeof(channels_available));
	if (ret) {
		dev_err(chip->dev, "read failed for BTM channels\n");
		return ret;
	}

	for (i =3D 0; i < chip->nchannels; i++) {
		if (chip->channels[i].channel >=3D channels_available) {
			dev_err(chip->dev, "Invalid channel %d\n", chip->channels[i].channel);
			return -EINVAL;
		}
	}


>
> >=20
> > The trip points can really only be considered as placeholders, more
> > configuration with cooling etc. can be added later.
> >=20
> > Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> > ---
> [...]
>
> I've read the sentence above, but..
> > +		sdm-skin-thermal {
> > +			polling-delay-passive =3D <1000>;
> > +			polling-delay =3D <5000>;
> > +			thermal-sensors =3D <&msm_therm_sensor>;
> > +
> > +			trips {
> > +				active-config0 {
> > +					temperature =3D <125000>;
> > +					hysteresis =3D <1000>;
> > +					type =3D "passive";
>
> I don't fancy burnt fingers for dinner!

With passive trip point it wouldn't even do anything now, but at what
temp do you think it should do what? I'd definitely need more time to
understand more of how the thermal setup works in downstream Android,
and then replicate a sane configuration for mainline with proper
temperatures, cooling, etc.

Regards
Luca

>
> Konrad

