Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C880140E5F
	for <phone-devel@vger.kernel.org>; Tue, 10 Mar 2026 22:49:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773182987; cv=none; b=fMnt4sfKpnuolmZrPfK2rCds65JXTGOEF77H5H60FoRbL+EcGE/GTkZloi4sYjPAfjzxTL62z4OA/COfeYU2LtGPTHuKPfVs2X5UjlAqFyVdkIMgPiQe1Qc2I7sljjX192k1TCZQlzd+8p86AUVuqSGYekzYBNy26FWCYwnpU+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773182987; c=relaxed/simple;
	bh=v+ZrcU91c9QASxR+/RihCw2I+Gl+m0lEe0t7KdGOWi4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lR195R5x6yuyIHHPIgFfp6tMy2Og38m2RipSH98IofUDURYTQ7eYAA3Htx7KJy+AreTJLq9p8sORKt514wFfNAOgZs5KG5M+iMynztj3p1p2WnrUsSAD8vKSJohUGDUfbmQK4DhaPyknOlx6Pp7tZrhLAzUfb0gFflYmf9CTdGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=obIyBVFt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=abz417BW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="obIyBVFt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="abz417BW"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62AIre3Q3759032
	for <phone-devel@vger.kernel.org>; Tue, 10 Mar 2026 22:49:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=S7mCBQwqvdOhvHU+bn8EBLkX
	cId8QXMT47Sfa58+8jk=; b=obIyBVFt+79DC16AzQUqigA/T/WocKANZpvD0BDm
	T9rw2E/X5zIJ0XoCxLlRGJwWkPAEMJwfctWulgnZOj6I4+77+zLIClFmn9SrrxNj
	snqLjbdBSUIDzRbqUIH+pUGHxfGoplbMQDOoZsWqFbEVoa+fuQ9uWrSZixOVrziZ
	ounFG4GGHt0vT+OKx+A/Wi7Xie9TJv1DjlPSwKRfrF/IZY/BaLMpJOmWOgVgEf/D
	idURrXiOr0btLB/fYlVoNaqpvnGCSK84RvSHd3vaR/WE3/Ew28c6CIG5ShswjXEk
	GbdCi2rIPqpRKENKtEX3GGAiP8wkYSEGAeklEci+ww61FQ==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctk8ujaye-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Tue, 10 Mar 2026 22:49:45 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-94eb42456bbso3039767241.1
        for <phone-devel@vger.kernel.org>; Tue, 10 Mar 2026 15:49:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773182984; x=1773787784; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=S7mCBQwqvdOhvHU+bn8EBLkXcId8QXMT47Sfa58+8jk=;
        b=abz417BWXpgS36vNsBAhFzusrXD88fEfSw4x1Ullu40lM/ZwEt7KuMCAxxJbQlc81G
         f0+TIg2EUyIQh+Pq1qJpFCM58uycnMuRRbBlcA5hZTsnpbYFxDidfUI1FL3ikwljJSzX
         etEIHW/G6DpEtiKOc6ZiBa9NJkgAw8tYqr6EYa6beR9DMj+ToR1cfz7XBCcvjXkF/COA
         O8PrftvTajjlPtdzNln0WkrqH8ke0O7iYZV9vEC1ftS5ox5nv9NMDGWBknrCoG23GiVv
         gYy7kXMJ2/bYVON3qPdS7i6iy//oNl3LJDa0TT7qgySCeAT80Acd4zFW0pBKGX27nrKf
         Iehw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773182984; x=1773787784;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S7mCBQwqvdOhvHU+bn8EBLkXcId8QXMT47Sfa58+8jk=;
        b=YXPNbhKsxS3btGm7oYfRL7jYtl+GMCvzmRgTucq5m6yIma90NmZMNkiVsi35pXBucK
         8ZQLqp67mZRY546kn9M2FJ6gC1VIAsQt2OXKQKsPxn4zF47t20zPxVjxZWjFBu/K8nSB
         0QH28Xe+gJjAwPp1xjbQ3pU3mWzY3w3Oo0ApgHihndF4J2QVtN8SPVeo4HNfp4Nskp2f
         hqDwHPhn0zrawsfII8xY7bRUClazEJOKPzoraOt/yRH+MSi5I7Fw4OJYkZIRrglpiblI
         wV+YFrfQpnrBmDMkz8JXOJy3X0P9MtwB/vLGtfOwTfLU4DV+f5cItua2cn42eDupE8R7
         EcGw==
X-Forwarded-Encrypted: i=1; AJvYcCUPe2LZygOjknXBzUh9wv4RihzSoZoZQBbVp7qit55yovrfHGVPpQuTwcKEHSniBEeo7euLTs7zL6yJCA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwYyiPIZatDqkUxF1r1f7yJoEftVx27bbkHLcPzeUrNZIifaOQv
	n3a1zP226sWpiLQ4Zv3PvKD8dL27YSfP/dAjTX8lRAkUKZHYBJgNG1bbzygvyYf9Y5Zyn3DDEtc
	7D03lO8aWVn+u6v9AnIT1VAnwEl/7v1mCvrKJ88/bhVtwyMuarK3FDKzLmxLhm7tGVQ==
X-Gm-Gg: ATEYQzwob3aP5K2MQ8dCCfHMYfVmw+ejVngdloAI6KSIj831yFBDImhP9mBJvyldVl0
	sI8LdvLMvyJNcWXG3jIbJYoT9OUey+g8FIM2eJVN/grAOLe9zXWcZ0spqXrMeviyu4gkCoT8LfG
	OrfE5gZiOPyo2hvNmLcEjue6qNr0PDXZdueWwmdGBINesjjP9m9rkq/DlWOi+sk4iSnNUsNcYpM
	Uj0wRaBgwNVLbcFxJsrjpWwebBqJiUHEl6h+R8AdqRY52AL0Q7hGKolzbb+TiDCSGzADvFyBWZQ
	YtB7Dj+kQRhNlC5S4ps5I1vS5dBefgaGQLJqLxMqK3K5imLCFaL9JHqVkSUI5lg9z2bDpms0CKk
	CQy/cWpqhDgGlFazcbnbwXriMA+hcKuRy4zN14Tzw0UCeD7eBYc+fbivvYiKh6VmePwVCAV5+pR
	00BDDiJTchPaxM8t8Ed3zDZqRGpIWAfkLRSY4=
X-Received: by 2002:a05:6102:3ed4:b0:5f5:459f:9860 with SMTP id ada2fe7eead31-601def7766bmr195777137.28.1773182984530;
        Tue, 10 Mar 2026 15:49:44 -0700 (PDT)
X-Received: by 2002:a05:6102:3ed4:b0:5f5:459f:9860 with SMTP id ada2fe7eead31-601def7766bmr195758137.28.1773182984023;
        Tue, 10 Mar 2026 15:49:44 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38a67e7908fsm559781fa.42.2026.03.10.15.49.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 15:49:42 -0700 (PDT)
Date: Wed, 11 Mar 2026 00:49:41 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: cristian_ci@protonmail.com, Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
Subject: Re: [PATCH 5/6] arm64: dts: qcom: msm8953-flipkart-rimob: Enable
 touchscreen
Message-ID: <6ddgxby2wzaa7mfbc64a4ld2rdbo6427csw6blzg5alstvkfv3@usfqftgctnzs>
References: <20260308-rimob-new-features-v1-0-aa2c330572c0@protonmail.com>
 <20260308-rimob-new-features-v1-5-aa2c330572c0@protonmail.com>
 <f6029a8f-07d7-4872-813a-ff98fd11b5af@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f6029a8f-07d7-4872-813a-ff98fd11b5af@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: Qd9T8rx8ASyyS20-lBjWzWQzp6g-xEuB
X-Proofpoint-GUID: Qd9T8rx8ASyyS20-lBjWzWQzp6g-xEuB
X-Authority-Analysis: v=2.4 cv=YcmwJgRf c=1 sm=1 tr=0 ts=69b0a009 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=sfOm8-O8AAAA:8
 a=cDFCKFFyOUkPfWTXbrUA:9 a=CjuIK1q_8ugA:10 a=TD8TdBvy0hsOASGTdmB-:22
 a=TvTJqdcANYtsRzA46cdi:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDE5NCBTYWx0ZWRfX5ajXjH4zifXs
 p5cBTdFSxqx7vwcWZSrlHGinhrkcjDHvyrMImIBPBqqwFku3gZUi/E9rJ92fTNJLEHgwz4m0I2u
 YAVBeUI39OHyV29OupUGzBTUXU0dHibNWuVQjAmu4/18NLmGdnqpPl+hkbCDGUxr9eepS8DJ2HL
 FTIX4IW2spYl7awvubtTnIh2Olr79zMd8XDTxhtEw28WdRYONCgUnviyi9qzBgI0gqbFi+MxCWp
 oZ7twFj0G5rKsBHSn6qSOsCKx7nFrfCRMpMkQFA1D3XyoSZMKqwDkj5UeU/t0RxulOmvyfQyeQg
 2FfPEVsIzkgavjcW8a1J5CRsoyTpojktv93L83ZfchMfahsdQE/pwZ02EjRZq3wSWev9TFvE7us
 fqDiNEmEpBIy94r5k92z3KSF1GkOle8bzwp7uPI7cTlaWPIBymWJIYv7Jw4bs/DTG4auhgtY2My
 ihlwWuBq45JCKgLmOFw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_04,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 impostorscore=0 spamscore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603100194

On Tue, Mar 10, 2026 at 02:08:40PM +0100, Konrad Dybcio wrote:
> On 3/8/26 4:52 PM, Cristian Cozzolino via B4 Relay wrote:
> > From: Cristian Cozzolino <cristian_ci@protonmail.com>
> > 
> > This device uses a Goodix GT5688 touch controller, connected to i2c_3.
> > Add it to the device tree.
> > 
> > Signed-off-by: Cristian Cozzolino <cristian_ci@protonmail.com>
> > ---
> >  .../arm64/boot/dts/qcom/msm8953-flipkart-rimob.dts | 32 ++++++++++++++++++++++
> >  1 file changed, 32 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/msm8953-flipkart-rimob.dts b/arch/arm64/boot/dts/qcom/msm8953-flipkart-rimob.dts
> > index 7b2849405462..709ea6fc9fbb 100644
> > --- a/arch/arm64/boot/dts/qcom/msm8953-flipkart-rimob.dts
> > +++ b/arch/arm64/boot/dts/qcom/msm8953-flipkart-rimob.dts
> > @@ -94,6 +94,31 @@ &hsusb_phy {
> >  	status = "okay";
> >  };
> >  
> > +&i2c_3 {
> > +	status = "okay";
> > +
> > +	touchscreen@5d {
> > +		compatible = "goodix,gt5688";
> > +		reg = <0x5d>;
> > +
> > +		interrupts-extended = <&tlmm 65 IRQ_TYPE_LEVEL_LOW>;
> 
> interrupts *and* irq-gpios sounds wrong.. and I think the driver doesn't
> even consume the former. Trying to read through some of that, I think

I think you need both, take a look, there are enough users of
ts->gpiod_int.

> it's on purpose since the IRQ GPIO is repurposed for setting the I2C addr
> (which nota bene doesn't match between the comment in that driver and this
> submission - perhaps that's just a SKU difference) during the reset
> sequence
> 
> i.e., does the touch work any different if you drop the above?
> does /proc/interrupts differ?
> 
> Konrad

-- 
With best wishes
Dmitry
