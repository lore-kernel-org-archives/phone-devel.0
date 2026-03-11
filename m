Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B8452FFDE1
	for <phone-devel@vger.kernel.org>; Wed, 11 Mar 2026 13:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773234988; cv=none; b=m/6fJ0B+UaBsc/wX40k177ollHW6zMVGX0TyqW9nTbNzNZZ/Ws6rrdTQl+E2Cums5yxHEVQkqT6vsmbocrXWebI8aksbdlfm6DZjCX6b5dCek9LFsQQNgyEPVvThS1DnJmrPKjEY+k1am0ja/WGD3aFWYHe5JjdkSy4qXy/r5lE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773234988; c=relaxed/simple;
	bh=BPcBpTSLzR+M0khjQ6a8GS3HOQlO3TRcuDpZlI/Ctc0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fi+bGguMXhdYfWk3XS0ABk5LwyBiFNNVxF8hJhmNPaCxgwiMTZE0B4aJi0fhe0u3LAbwGxzl0oUWpICApfkqtlRueszsCiSTbuIOEctPcUHrup16QQzgaxIhvIvtJmA/VuBQ8gC48J1anFkpnHU0bVCs1taNO5TGrwHuuHOMzyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hVoNQyhV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eEsX6Z3A; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hVoNQyhV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eEsX6Z3A"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62B8nWC71572980
	for <phone-devel@vger.kernel.org>; Wed, 11 Mar 2026 13:16:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=kgO3mDUXwOAtuCC6J52bMWdN
	DFJ99hNEfn1Q6yBrXSM=; b=hVoNQyhVeWlWZ8PuOGIQk3PtMxDxv+MFV29zpEjB
	7qzYPnl5CjT3ZTU5PeNQ4tUT/CIS04vzFUO/fP7RK7TwVuF4EjQLFMNJRBGb/0MI
	ekI603UrOlXUFpLIe31MkTw9gfX58KHNLVKTIuZVPD9gha1Bhqj+z/jS92N4eP3+
	JB314G2UW0q/VqpTcREUMap9zplA5OJysDY2JIQ4d++hpWWj31usT4TbpBLzrEOj
	HE6NiOFwDPc4kbuIZDtn8tz/EIFtfERf4WJ/BJWEcAGhvvyZyVuoD4q5P6R8qy/u
	bGBNDGfEL7pyemn1mvXUIxbG+bN9r/HxuM3wAyXHRuu5LA==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctqgkbqf2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Wed, 11 Mar 2026 13:16:26 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-56b180963a9so42651945e0c.3
        for <phone-devel@vger.kernel.org>; Wed, 11 Mar 2026 06:16:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773234986; x=1773839786; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kgO3mDUXwOAtuCC6J52bMWdNDFJ99hNEfn1Q6yBrXSM=;
        b=eEsX6Z3AcbNKu3zj1PCr+1tDHXqjH3N3F2WRfU9b6M5jyqlFR4sBMbyAZG1wIoAWX5
         rvSR+e3Kq6S2SUgkCeWjvadObI6gsBZo4dv/9PAw8SHp46wuDiTA5NuIJ0GoMiCTigr8
         hoxMD+D4/gv1buy6yiPxy/WtB/oxxDK9NrhUfSYSxG6mKHj8zavulMzhIjNPo7SK/lWw
         jDteRX6wkd1JJrOPwVIbedBax7krIgOW6ITmovuAiCuT61de6Eu+xRPwN3VNsYnx7ArV
         Wu7H1JFfUNy+o5qCFxc0VRfkEv6PhvG0Bz6+VN4rC/ltjA888kkWBGNqYfNGQq72wpEw
         zjMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773234986; x=1773839786;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kgO3mDUXwOAtuCC6J52bMWdNDFJ99hNEfn1Q6yBrXSM=;
        b=dnIeNa1ajjlvVgVURdo8t2rdxM7EQOt3hrUttpfIMS5XUPk8FGdFYAFbsdH6JVkmbR
         a2SNzTSmQCEK+LDPuJ8RcN5X5i5QUP/lgj20t3SFogCPzwgsiTODWjB1FgKhqA2Cb+wa
         BkW33tapjHaUQDmGbmjGA701AIfe7GyZb2x3rrQ6XtWxba0Ogbj8Y2R1NWiR3kf1sHja
         pXhilhY0A3qxllAMzNd9Dl+du4FKgrWSdFg978othLLtGU8Sjj2Yn3uwddUANmlW3H7b
         yOcUitOJ9UWmIi0xZMyeNCwrXzRjgEZXt8GU3lVPthcMV31KsaAlXVmSheuuZFJJs2W1
         Yg+A==
X-Forwarded-Encrypted: i=1; AJvYcCWwH1LR2K9Vo3RX/ztzlZpXPyn+LrK7rIvLRPH5lNRnLKM1ihzkaGlx/A0N1xS9aad/L9ebwaX8C/o9mQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxDsKrlCzc5VTwE+0d6ApQtRo17Scj/uWPvQha0AtLtQ0+jkjxc
	bCaVmYxfrEJNmR2IeQqEfJVJWSFB8l+jSOyPnsTIIZFRskqHbJT4Ojb5k2ObJJvQLI3T4KzL++/
	6UBmeUZdm3oR103JDS1R+WdJa5yZjmvykAJHaNwiD3S7rC3uGgQDbinxSbQU1QopyTw==
X-Gm-Gg: ATEYQzwigbhoChrUoaGDObMnW6AzUjE8Op8FmL95p896Yt+JoPxJUZ7N5i3QY3OOHff
	4d1qqruxAZDum/HrNxShmTBnwNnjt9YsRJbk8evPRjV9djiGzFRprvBofC20/JcN18hJY2KhXNS
	iOz3WuwTFql0Dv83XARIvztnVbnruxt3zNiooD2UVKqLXpMalBoCaCflYZzHD5ze9Gx0qrfDhl/
	qaKA2kM3qOEd4Zjp7rKH3f7AISuYykD9uuBa3DLG4t0wXraSqA/QC1bLH6TOgiHnvh5LhVcM4El
	MxP6VbrRznnRdbx0CKq0H7df9KsEpbza0x6Zpbg1VqfPE1fZqQl74t3Ra0uKLZsTyQpEagqcEtl
	TeHlupu1Z0pmZEhUP7VvT3AZu7JEPSqvmOyzjIVQJ83Ga5xtX06MvX3bhDL1tyyA8q1PlDHJfs5
	TtTfh5haxpZONU+hMP85BYgDOUM2LYljKCC/Y=
X-Received: by 2002:a05:6122:e203:b0:566:22e6:35df with SMTP id 71dfb90a1353d-56b474501e5mr980229e0c.5.1773234985745;
        Wed, 11 Mar 2026 06:16:25 -0700 (PDT)
X-Received: by 2002:a05:6122:e203:b0:566:22e6:35df with SMTP id 71dfb90a1353d-56b474501e5mr980199e0c.5.1773234985331;
        Wed, 11 Mar 2026 06:16:25 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38a67e70d66sm4087301fa.40.2026.03.11.06.16.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 06:16:24 -0700 (PDT)
Date: Wed, 11 Mar 2026 15:16:22 +0200
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
Message-ID: <cddnaabou6vdcdt5pt642wbf3w6e7vwisrnczc3b5wsqtliwql@sqvdkq47tibj>
References: <20260308-rimob-new-features-v1-0-aa2c330572c0@protonmail.com>
 <20260308-rimob-new-features-v1-5-aa2c330572c0@protonmail.com>
 <f6029a8f-07d7-4872-813a-ff98fd11b5af@oss.qualcomm.com>
 <6ddgxby2wzaa7mfbc64a4ld2rdbo6427csw6blzg5alstvkfv3@usfqftgctnzs>
 <c58b9a2a-8de4-4831-be69-33b158052f54@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c58b9a2a-8de4-4831-be69-33b158052f54@oss.qualcomm.com>
X-Proofpoint-GUID: rZOddFY5vHZhXhsBYY83spjCptuaN2E1
X-Proofpoint-ORIG-GUID: rZOddFY5vHZhXhsBYY83spjCptuaN2E1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDExMiBTYWx0ZWRfX9Y2ebpIjASzo
 VDx3+2Qnmngm2LSTI/nJyokdtKsASILHvZ960yjGoA/E5bhK2Q8/8vzsaC+phKp+JQAcB7Lh58x
 wAk+65DhFhFjd6/HBfIJ69v0F/6/tloJE08py7TkuZWA6qqrKaF4ftfJXvjo9q0FXaZJth1C1nG
 iwQRO7BeEkUTtR+22wjodhWeYPJ5GIMpbSrE1vPKOPkx8kE38QNtdCKsa24/1h33z/rEkPwo61D
 aOvTKvNfM0gVjjKp6HOg/25d+0tAbaqJgXZnH6djTCTK3d8XOyRZc4l23T30AnmCTFyFgqsCoDm
 fEXmW6h5Ae2LHE7xUkjrcOA9WORcRflta98mkTMX7cNfv7ezuXMIe32y3OiXbQlGgqkoiDgbbYZ
 7D8Kbj92t9GGeS0niU3wWwabhUAEJrwAldUqMuY6wG8Mu4k5jm7/fiin3KeAGjHCRzERbClacyV
 xyNNBVPLvOQ1aJXOEAA==
X-Authority-Analysis: v=2.4 cv=M4JA6iws c=1 sm=1 tr=0 ts=69b16b2a cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=sfOm8-O8AAAA:8
 a=JS798oX9D395Q03-T_IA:9 a=CjuIK1q_8ugA:10 a=tNoRWFLymzeba-QzToBc:22
 a=TvTJqdcANYtsRzA46cdi:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 adultscore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 spamscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603110112

On Wed, Mar 11, 2026 at 01:47:48PM +0100, Konrad Dybcio wrote:
> On 3/10/26 11:49 PM, Dmitry Baryshkov wrote:
> > On Tue, Mar 10, 2026 at 02:08:40PM +0100, Konrad Dybcio wrote:
> >> On 3/8/26 4:52 PM, Cristian Cozzolino via B4 Relay wrote:
> >>> From: Cristian Cozzolino <cristian_ci@protonmail.com>
> >>>
> >>> This device uses a Goodix GT5688 touch controller, connected to i2c_3.
> >>> Add it to the device tree.
> >>>
> >>> Signed-off-by: Cristian Cozzolino <cristian_ci@protonmail.com>
> >>> ---
> >>>  .../arm64/boot/dts/qcom/msm8953-flipkart-rimob.dts | 32 ++++++++++++++++++++++
> >>>  1 file changed, 32 insertions(+)
> >>>
> >>> diff --git a/arch/arm64/boot/dts/qcom/msm8953-flipkart-rimob.dts b/arch/arm64/boot/dts/qcom/msm8953-flipkart-rimob.dts
> >>> index 7b2849405462..709ea6fc9fbb 100644
> >>> --- a/arch/arm64/boot/dts/qcom/msm8953-flipkart-rimob.dts
> >>> +++ b/arch/arm64/boot/dts/qcom/msm8953-flipkart-rimob.dts
> >>> @@ -94,6 +94,31 @@ &hsusb_phy {
> >>>  	status = "okay";
> >>>  };
> >>>  
> >>> +&i2c_3 {
> >>> +	status = "okay";
> >>> +
> >>> +	touchscreen@5d {
> >>> +		compatible = "goodix,gt5688";
> >>> +		reg = <0x5d>;
> >>> +
> >>> +		interrupts-extended = <&tlmm 65 IRQ_TYPE_LEVEL_LOW>;
> >>
> >> interrupts *and* irq-gpios sounds wrong.. and I think the driver doesn't
> >> even consume the former. Trying to read through some of that, I think
> > 
> > I think you need both, take a look, there are enough users of
> > ts->gpiod_int.
> 
> I said irq-gpios was necessary, interrupts is not. The only retrieval
> happens through:
> 
> if (soc_intel_is_cht() && ts->gpio_count == 2 && ts->gpio_int_idx != -1) {
> 	irq = acpi_dev_gpio_irq_get(ACPI_COMPANION(dev), 0);
> 	if (irq > 0 && irq != ts->client->irq) {
> 		dev_warn(dev, "Overriding IRQ %d -> %d\n", ts->client->irq, irq);
> 		ts->client->irq = irq;
> 	}
> }

static int goodix_request_irq(struct goodix_ts_data *ts)
{
        if (!ts->client->irq)
                return 0;

        return devm_request_threaded_irq(&ts->client->dev, ts->client->irq,
                                         NULL, goodix_ts_irq_handler,
                                         ts->irq_flags, ts->client->name, ts);
}

I thought that i2c_client->irq is handled by the core.

> 
> Konrad

-- 
With best wishes
Dmitry
