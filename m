Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E27A22D877D
	for <phone-devel@vger.kernel.org>; Tue,  5 May 2026 10:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777978202; cv=none; b=JlItLXV4qF9KFFAdGVe4VCGVTYnbqvKkcPu8UXzT/0zukyKKk9ZSp4y6ZbH2AEUa8JiIHh/fJZWNAfavmeTOMqqdOz12wvjeaU4yzzIXqYCnZZUNIMNvwDe0u/v/0f64dWYlDFo4gCNl1Aqv/ubSVuSFQBAdGUuI0GzO6Zy2zNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777978202; c=relaxed/simple;
	bh=YcedT8Hfo7viBomSJ6+7C6YDOpC7Sj4vecnEZZ9FNFE=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=P/1AVV6SRLFxEkFAjMQAaoTP/nODYdN6E65wPeJpw0fgSsYmkASspGtoIEN73LEwxllB7oQBpwqIyNz73hgqx79Yzl4lc6djetSiec8Qcfv3aAQnkzZdqX1Y6gnttpKz9etVcSkVbliXKGdsUsUC/Uu4TE8BuKzVDjQUzHglCPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=QsGj+Ja6; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="QsGj+Ja6"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-67cd93d8affso556488a12.2
        for <phone-devel@vger.kernel.org>; Tue, 05 May 2026 03:50:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1777978199; x=1778582999; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YcedT8Hfo7viBomSJ6+7C6YDOpC7Sj4vecnEZZ9FNFE=;
        b=QsGj+Ja6HsATb9yOQ2YXRaCLv+zbT6BEsknbCFiKd1mQmGjQ3qcvmOd+l7HId964IL
         vtL2YKy9oHvbVs0z0ZFBN8zke8ydFDf0PYflw25xLb+Wl3lnUbPC8ikhcJ2nATeJb9QU
         NxHmRQuzf0RSxyprv30zDph1m4LjPle6InXQx95VeOKTDbfQ/87S/PveFpZNhr4uoUwo
         PkQrr0on1C9v9wLgK/6LnTg71jikv7HVcbO80iouPZKR8h0xnHmvw9ZlqWhkCJxspfUm
         VopKU9H/A2BiL8IbDWwlOQ/fTKkAyhZhJRSaYk8rRvin9PlvCyne1HUgGsKu7nSQrJq8
         Ov/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777978199; x=1778582999;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YcedT8Hfo7viBomSJ6+7C6YDOpC7Sj4vecnEZZ9FNFE=;
        b=Y02V/JAq+jJRZbXMF/iinBttpzQ97G3lsL0LAIs5AGHVYdoUDAd1wdyfki2FVbhN2z
         OE74ZSydoOl8hvQfsLEi4oZnezgX29m5Z58JrRipmS7cOozF/37mBZiLVD3f949kgXJZ
         t3P1/hn5gh6hNa9MdpTDsnuQY5jZ+Y397/D3uhLcdOA5m+SlxYq51w1JbIEg5UXlq9rW
         JIcg9AzvbvYBMxY2UpSuPgZuXQRafy6/0sYcU82c+Fezyv+pkbZGXZvESPEEiezsAor6
         /fbF0U4u2GP61PDdIYlIyaBg1gkThpAuO+663hkQgMvnzGS1+p+5lQbW841wJK3soQD8
         8Dvg==
X-Forwarded-Encrypted: i=1; AFNElJ9L9ahbfpGRu5Vkmn54+MhurhfSS3SAgCVUWq4mxuUmHxHqJrZse+BokGi5ZEEcq5Hh0nlcfvuW6RdeIA==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywen4Tcy77Ce6uPUFNVUVK2rGA73+bKeD8trVQAt0k/rMd66Ppn
	38bno2k/srsgVHZTnxASnguW3Y/7tFpX3C+P1WUmunw0MQKmLE5schBoJZ5AnG26ikA=
X-Gm-Gg: AeBDies5iRkC+ZuOjg2BWB314iarmeNfER2IOuyyPLzf8lIG/Ltiq/vBtKYR3rRyjP0
	UPAOhYuU1CsnRvb0gExxw+zx2EQQvZD22wRrLKGndKsDf+tSY+rcf2AEiKpZ50jVPjQpbz/9Y4+
	ByoUFG5npEiv4eR28D+Ts3MFk8/wRPL+54HU93MvMuJoBCrBNqu4YOiQ5/zDzqRIUfdZfykqx0S
	rD1gLlwptg5xpNiAyiKYcwR87Qka8GxGR2Jgb0r4Me0KS1hKrsqnPS2phtKO1c/Nv1dVypcpF0+
	kB1W0HTIipn06iKB6vlAzWmsFGy8VXUg3OIeT5tkLve2krU6qJkO1TBUZniTj2c5sNShM/dwh5b
	Pdb5P1lLZPS4Jx8a97QJAfr3e/ZpyJ2N7DWaU6UQy5ujrulWRJKnMGfYQWDjOVAKk1F5iJ9sreg
	NVO+fEDz9I2IZPKbW0q3OwqIRv10o9fhu8Re69oexLP8gsFpN+T7RzZY/QTegJ3ik2RpiXI2kRK
	B0xUexlD5ozv3xmpvVUuZHQopjbGiYu90ZFIKmrHe+NkqY=
X-Received: by 2002:aa7:c707:0:b0:66c:17d5:c18f with SMTP id 4fb4d7f45d1cf-67c1aab2f5fmr4883394a12.21.1777978199217;
        Tue, 05 May 2026 03:49:59 -0700 (PDT)
Received: from localhost (2001-1c00-3b89-c600-71a4-084f-6409-1447.cable.dynamic.v6.ziggo.nl. [2001:1c00:3b89:c600:71a4:84f:6409:1447])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-67cd904fe68sm297388a12.0.2026.05.05.03.49.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 May 2026 03:49:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 05 May 2026 12:49:57 +0200
Message-Id: <DIAOO42VKFTK.A241C4JZT34G@fairphone.com>
Cc: "Bjorn Andersson" <andersson@kernel.org>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Konrad Dybcio" <konradybcio@kernel.org>,
 "Srinivas Kandagatla" <srinivas.kandagatla@oss.qualcomm.com>,
 <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Konrad
 Dybcio" <konrad.dybcio@oss.qualcomm.com>, "Dmitry Baryshkov"
 <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/5] Add LPASS LPI pin controller support for SM6350
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Linus Walleij" <linusw@kernel.org>, "Luca Weiss"
 <luca.weiss@fairphone.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260430-sm6350-lpi-tlmm-v2-0-81d068025b97@fairphone.com>
 <CAD++jL==mAQAmfQDcnasnjgXnTsN46nFBgFuHOz_1Tf-k-3BpQ@mail.gmail.com>
In-Reply-To: <CAD++jL==mAQAmfQDcnasnjgXnTsN46nFBgFuHOz_1Tf-k-3BpQ@mail.gmail.com>

On Tue May 5, 2026 at 12:35 PM CEST, Linus Walleij wrote:
> On Thu, Apr 30, 2026 at 9:10=E2=80=AFAM Luca Weiss <luca.weiss@fairphone.=
com> wrote:
>
>> Introduce support for the LPASS LPI pin controller for the Qualcomm
>> SM6350 SoC, by adding the dt-bindings, driver, dts bits and enabling it
>> in the arm64 defconfig.
>>
>> The custom slew offset for gpio14 is described as
>> "qcom,lpi-slew-base-tbl" in the downstream dts[0]. I've tried to find
>> some reasonable solution to have this handled correctly in the patches
>> here, but suggestions are welcome how to improve the situation. There's
>> of course several ways to implement a solution for this.
>>
>> [0] https://gerrit-public.fairphone.software/plugins/gitiles/kernel/msm-=
extra/devicetree/+/refs/heads/kernel/13/fp4/qcom/lagoon-lpi.dtsi#25
>>
>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>
> Fixed up Kconfig text and applied patches 1, 2 and 3 to the pinctrl tree.
>
> Please funnel patches 4 & 5 through the SoC tree (Bjorn Andersson,
> I think.)

Great, thank you!
