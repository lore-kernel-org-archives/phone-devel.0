Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB17C21ABCE
	for <phone-devel@vger.kernel.org>; Mon, 17 Mar 2025 07:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742197551; cv=none; b=WtuzMpNo6AL91IyRugVSrByUWJqduTpKQpCI6erGMJ/I09Di+AcK8llv/zoDPKP/19AOZx4vFP5AQIxK9PqyLJyjYIxyEGH7jfxDSyLyjB4VasFnS5417K36TTLYifQM1If/8WW0+WpFciMcn53ZiCf6PJZaGGpHKDU8ccpoUgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742197551; c=relaxed/simple;
	bh=z/35C6OncKImSrzwCMGsv4v7SHuEIwjIRKaGVCMngMk=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=JOxxMqbmVRSMV3I2NNRA1QMgsSFnIZID4CPYQqELD4BjQUGlzyYviKyIAS5hMH1co5saozzv9Gmo84/sLkaoByebO1ZzdWGyRY+ymmVcCLVNOkcXgmsBbhh/Np5A9S8LkT6uM6pCp2lJZjRAFU7FzK9f6fA7ohqjwl3Qyceusmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=SKEvc+fa; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="SKEvc+fa"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5e61d91a087so6223384a12.0
        for <phone-devel@vger.kernel.org>; Mon, 17 Mar 2025 00:45:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1742197547; x=1742802347; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gl7H7yZOIWFrlEzxdHx2ScaCc87hpAhwNF8CQ1QYBik=;
        b=SKEvc+faLEJJIRTvnn7nJyhuqtSC91fYhPUaM4EqY2EHC+FV2cPcLnlBagyvmEnv3W
         dG69pcspGSax0w4/OXWmYqyo3Oh+qD1h+n8MCf3k2daVrm5Jh82vxgkpgHFAPokeq3Js
         CaoqeTH4hS1KfpGm2CYmIaK8qiisMHd4FwCp4U0823sGqc8UgkDF41QiveiFD+zo4bPf
         04zWvXBLP8z8wVzIKds/n1A77x9A9SGZgB7UEvgWmEX9Sea0lYdFQkOTnkonRi3wNZvw
         51KUI07RWyW+Kct/edAQq/TuyYm3PvALwuZkI09dbcWRzXOBA9X3fDHyC8BrwBRtuZf1
         JEHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742197547; x=1742802347;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Gl7H7yZOIWFrlEzxdHx2ScaCc87hpAhwNF8CQ1QYBik=;
        b=LCZHsv0lOU8A6DeTdqI3aoelk0rAMyM9+lADAs3KSQ+m55qs1rB1V25CE8Cbyf/xQc
         kpxxbpmPHm8MqGPmolxjmRoA7R+Re6UvBENFK+Or699/N64ETC/rNFXPvpldaMpHDlzs
         R3tEprLfIR44W05tQvFfjTuQ63KPcyCk6sleU7nrQhqlBoJu+m24qtvpy6D1dqIiAEJJ
         vLqyFR2YHO4lb5N15KuPCyq0DZQBr63i9ZsFuBkLN9FmevBB0NAoECe792RKl14yjCxs
         3LXBP6i6Wk4c2KjO0rf9NkqnWi+N4LhuikY3pQGcK9xk9stdr0ZhaWndg2HXQOhvvrzG
         Mj8g==
X-Forwarded-Encrypted: i=1; AJvYcCXEoL6V42Kz/bUFzU8Kp3soGH51Bi2fbeh/3kN64nOAlQfRN3kz+/FyUYVoa+DPFJ+hKLiyQRIkp1xSnQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywtds/0GfMfUe2NQrQSaQzUgbFPcnCGH+48rYPCAhfUOsIqhVKe
	GrpD51Vc6kRqir7M8wzU4vmJPq84ZCOGoAceG611Q+JZgnc/uOyB81F+mJQW28I=
X-Gm-Gg: ASbGncveXIxbzeqGsDEUa8CAQhT2g8+HyXsFOg7ZyyuD4v37pNNjC1ibaKjNXRWxaFC
	qjDuyQQuCSFuT6RyJe6ashKC/5Zi7qaXdc9WY3wGJflbcijC+Vg1KEyBNKlpQGJE0MnOOIpDYrA
	E/Z1g5/cjvNuFZzGd5pjHgv/pdeX9Zul4FgLx5C3RMGMLDRlCJRNTcXpZBepQhScNR6li7Z+TLR
	FnyZN3PPLV76yLo5CCB3FjBPMrhjOomBHKqD0+nzGNkKglkl/VfFq4LsTEFVaajq2n4UQmYpnIq
	uHST9+AMA+AQ1i/VxrnsWD35h7XDsNg+iZNPztCGGLAXmJ8k7qKp5vB085cT1DsFcrEKRq5rJp9
	W7eGgcDvLI3F+VQ==
X-Google-Smtp-Source: AGHT+IGmNMHuunVdQSgHrKnOfe/ERZGsvr0xj7JwdS+NX5aLfGQnW8CH56uoLVrH9JWD/35XdRKpyA==
X-Received: by 2002:a17:907:2d92:b0:abf:6b14:6d00 with SMTP id a640c23a62f3a-ac3301e1e64mr1158441066b.5.1742197546956;
        Mon, 17 Mar 2025 00:45:46 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3147ed1e4sm623996666b.66.2025.03.17.00.45.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Mar 2025 00:45:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 17 Mar 2025 08:45:45 +0100
Message-Id: <D8IDHJAC4BJ1.WNTMQEJXD2R2@fairphone.com>
Subject: Re: [PATCH 0/2] Some small preparations around CAMSS D-PHY / C-PHY
 support
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, "Robert Foss"
 <rfoss@kernel.org>, "Todor Tomov" <todor.too@gmail.com>, "Mauro Carvalho
 Chehab" <mchehab@kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Barnabas Czeman" <barnabas.czeman@mainlining.org>, "AngeloGioacchino Del
 Regno" <angelogioacchino.delregno@somainline.org>, "Caleb Connolly"
 <caleb.connolly@linaro.org>, "David Heidelberg" <david@ixit.cz>, "Hans
 Verkuil" <hverkuil@xs4all.nl>
Cc: <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <linux-media@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20241209-camss-dphy-v1-0-5f1b6f25ed92@fairphone.com>
 <D82FU3SIX5RZ.1Y525GJO0UOAA@fairphone.com>
 <eb06daf1-3cc3-4b31-a0bf-bc450cd0f041@linaro.org>
In-Reply-To: <eb06daf1-3cc3-4b31-a0bf-bc450cd0f041@linaro.org>

On Wed Feb 26, 2025 at 3:47 PM CET, Bryan O'Donoghue wrote:
> On 26/02/2025 14:13, Luca Weiss wrote:
>> Hi all,
>>=20
>> On Mon Dec 9, 2024 at 1:01 PM CET, Luca Weiss wrote:
>>> Since the hardware blocks on the SoCs generally support both D-PHY and
>>> C-PHY standards for camera, but the camss driver currently is only
>>> supporting D-PHY, do some preparations in order to add C-PHY support at
>>> some point.
>>>
>>> Make the dt bindings explicit that the hardware supports both (except
>>> for MSM8916) but also add a check to the driver that errors out in case
>>> a dt tries to use C-PHY since that's not supported yet.
>>>
>>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>>> ---
>>> Luca Weiss (2):
>>>        media: dt-bindings: media: camss: Restrict bus-type property
>>>        media: qcom: camss: Restrict endpoint bus-type to D-PHY
>>=20
>> This series is still pending, both patches got reviews and no pending
>> comments from what I can see.
>>=20
>> Would be nice to get it in for 6.15.
>>=20
> Yes this should be merged.
>
> Thanks for following up.

Hi Bryan, hi Hans,

6.15 merge window is approaching fast, I wonder if this series was
missed still.

Regards
Luca

>
> ---
> bod

