Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28F99408630
	for <phone-devel@vger.kernel.org>; Wed, 10 Jun 2026 13:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781098154; cv=none; b=AwpDj3rOYCb6eIcjgU5JUhRix40/S2V4fBd8c/Q4QOFDx7X82X/O4w7BklPyLE8sxLDk87v1czW07rwJDxVxhLY2E3xrYtyZjBdcfufUDUbz2s4mMoOuGbBeBw/HJSowyf6/j00ZYk4j7k4FiQGaZPhzp0QdxiiCsRykOpskcA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781098154; c=relaxed/simple;
	bh=XlUfeydIkfGOxP+AXkc7DyRx4OXIbShc1WzhxwU3BzM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y9CcthLWO1qY8SjR00UeOXndL4zi3D8Aw0//1WldqY5emqnPAEC9zsmCqhCgVfHoHFh1wcFpbdlg3BFlvY6YvSbqriqC7sg5+E4lWQQ2+UYEvdaj+qr3Hu/EEhDpEOJUJrehoY9/p7BM7MF/p5sRw4/Cls1cBvx5FEmK+m8Mbog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aJ37jiM/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DynouxFD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aJ37jiM/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DynouxFD"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65ACCBBp1472547
	for <phone-devel@vger.kernel.org>; Wed, 10 Jun 2026 13:29:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oPBM2SY7J2ytmLbs6zwvhphdQ1vF34NxqujsJ2DX2UE=; b=aJ37jiM/IY80OeCg
	Hnhd5j5glOLnWr+Mep0CMHhkt3XDyue6UNjvUXC7xmLnhidk6Go3htheIyIL9G+l
	WqemQ4PphBO6vCSo9Zs3PLnAjzWU29BUCHs1pnrtrePguM0uMGB05UGYbHSJr1Tf
	1B7Zf/4pqYG4gjFut4scG1POUaqEuXHHRSIJjsIJBmBnZp3My7ci14jne3Xuk6fF
	v5wLxt1cBJYzjdFTNfwwcd8ruMvEayoEkTDJ9hPJDYMsZVhLAFWjdg3tSXiIW4NW
	KA8ffAsa3B5add3L1f1bl+j1yTjHsN0PcDmNZY2kw2IEPvsQ+U0fHSGJnQdGVVHR
	d1pc3A==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eq0kda1my-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Wed, 10 Jun 2026 13:29:12 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5176891d0a9so17150831cf.0
        for <phone-devel@vger.kernel.org>; Wed, 10 Jun 2026 06:29:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781098151; x=1781702951; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oPBM2SY7J2ytmLbs6zwvhphdQ1vF34NxqujsJ2DX2UE=;
        b=DynouxFDpZS3mSyO7X5olJ+7DKHfROJqwTDZbStu0EWlpTJQP07TputzaV70Bt9lWC
         Dwje3JO1Ltxu5yzkAIAtOBppjKtIJ6aE0mWvVBydEn3zBfCdm5pXqIxsEAkqBM53k3/9
         Vt71kg3QBnots4b0HxjrlcpU5M0pkmP5BvKYgK55j2IcMU9h6rELjAW/HON5K/OIAZhk
         FJ9lp/eMRwyC1eCe8qJviGxF+/Q4SnYBtAsf8P65fpA9w7PIXXw3B0j5eB+YrBBstTC8
         KnOIfbhPhipY6j7yrt2SAoHQ55Eh4cVNZUOjYM5oNH+TRWNzZHCFrGFwaBGDDdq9rCEG
         GLmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781098151; x=1781702951;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oPBM2SY7J2ytmLbs6zwvhphdQ1vF34NxqujsJ2DX2UE=;
        b=KK1MfcknRvTbgtSnH18VvIEqXxPpdxM6W9bNjsJO68k7tQ8+PHTZLCB9sJNQvP2C28
         EWHLK1888aldBPPPRtU4rCu+wR7fdgGhljC6KOdHmSX39P10LCsOOAw9YFG7fGvjlvtX
         xrPUItDzU5R53iZbTt4QpT6L4NZTaUFowIG4LNICGG2ggRV4NcKU35zbmzFRY9NDgWC+
         CYY/WVcQFHSzvPMiOkkDrXxq7k9XLEFQPns0qsoPaa3PAZhemYkIykMBPHaTuzs1HfiK
         vULY3hBX7GO0Hg3p/E2VXCNTgf1DAN0rMzdXgrbNpAhB/OXr/wDngUtZXtIoDhbN5Rbn
         z3Zw==
X-Forwarded-Encrypted: i=1; AFNElJ8W5g5NTDofgHHFa6Wkf2VnnIqH8n5rPnCSwlEb0Qw8S5VOj7Up34ATt+W5VBgmzlJrpJvV1WuIZrkC/g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwQt6eQIYT7/u3VCgBWmm7m5MLx4fGhsEifzptZuvBVm1Dsh6Fz
	b+AIW3w+9yRN/RMWhoDt0U8k/WJkJHrlUSCymKvkG9Uctvoo0WXxPVjpxQQK8HdItEgxOhur4EL
	Uq2DaON83ZpW+psSPAFriqW2MPxhLL61HHoB+LsR5Igx2+50ep7NJGpqdPEU6mCmk/A==
X-Gm-Gg: Acq92OHsmZK/wGJWDru2TxJc9EDAotWqBkD+4rILLZvYVXA1Pf6zTxGozwIa2YtvsTs
	+NjfvDI//t/Fhh+F7BStqFS54tioeDdl5cqxof0/td4w9ML2c0Li0W5+7ZQ6AJ5iSq01jfBPsGp
	R7IK41nmDBgRj+Uvf4PIaj71tSOJ3pkGpdS1OneHKgMDJA2RPkqH2loG/uZ5R9sLjosmLxkz+2h
	NUE/zeTILwDf2Q3bJeoc87AyuwFnUuplGnaOSA+z/uYg+F0qCQd2ZHxxQi0TCNQQi4iXucKMynl
	Qf57lwQFoYk/SP5kYRFa/g15FnBShRjkX+a1r58D+U8xzptdTc01pJdXicLBsuhqE9SyaeLZDxq
	SMOIXlbuxq13uAYDRUUR03DAt4Y8/XkPngJ3mf1vAyxNbPln/8u09eotn
X-Received: by 2002:a05:620a:198f:b0:913:b4b9:5ec8 with SMTP id af79cd13be357-915a9db3db3mr2313109285a.6.1781098151434;
        Wed, 10 Jun 2026 06:29:11 -0700 (PDT)
X-Received: by 2002:a05:620a:198f:b0:913:b4b9:5ec8 with SMTP id af79cd13be357-915a9db3db3mr2313104985a.6.1781098150880;
        Wed, 10 Jun 2026 06:29:10 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf054e051cfsm1196208866b.38.2026.06.10.06.29.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2026 06:29:09 -0700 (PDT)
Message-ID: <5759d855-e365-4aca-96d8-cea2c4ff630c@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 15:29:07 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 6/8] arm64: dts: qcom: msm8939: Add venus node
To: Erikas Bitovtas <xerikasxx@gmail.com>, Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        =?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org
References: <20260526-msm8939-venus-rfc-v9-0-bb1069f3fe02@gmail.com>
 <20260526-msm8939-venus-rfc-v9-6-bb1069f3fe02@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260526-msm8939-venus-rfc-v9-6-bb1069f3fe02@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=TeamcxQh c=1 sm=1 tr=0 ts=6a2966a8 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=HDjIzE35AAAA:8 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=s5tj8q4C22HW4gDRz6IA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=y3C0EFpLlIT0voqNzzLR:22
X-Proofpoint-GUID: 55cVJkkUKCcg_qMJxZEDfc6wn5gSYeLe
X-Proofpoint-ORIG-GUID: 55cVJkkUKCcg_qMJxZEDfc6wn5gSYeLe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDEyOSBTYWx0ZWRfXzU1PgPLzZc+j
 GIfjTrgaAmJ4bqahkgpPXnYHzZDMTweS2ujzpZ1FCLfRzoo0XU2WPzVGt030O0Hzf7d9OWQAeNU
 OvZnrYxHwNNYV1HD1J/8UEkWOArC5BsfuvakvKcoG/YmfoyeVA/srGx5lUFrw+RnfQ932ML3vC0
 UMhsOJmFq5eTsPbZnKQ5IhL9yLcNfqNgyYyn5sOxrGty+hX04OOVjhAu7uMC843uqWWy01E8Zax
 9/LDSQY8O3PWLoRpOIwNSfrinkeHZMIomFy8s0JFaI7g+fDq6cVJq094znsDQyNmtTlFf2Y+0Ve
 BXndjUxLR6QECzGv1CoOMTeO2u2d2AhydjgeDAk9UTifsLBCwmR0nx6YXLmdyncyQG6hhyK5hC1
 uRqQMiAJeTtyoEOr6n/5o98auAGT6ZUhX4GJiM2DeZyYErOgvYoQuKGUmKNIqFCRtVoIOcJVf82
 Lp849w+dwt6UtqJrTjA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0
 impostorscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100129

On 5/26/26 3:24 PM, Erikas Bitovtas wrote:
> From: André Apitzsch <git@apitzsch.eu>
> 
> Add DT entries for the msm8939 venus encoder/decoder.
> 
> Signed-off-by: André Apitzsch <git@apitzsch.eu>
> Reviewed-by: Bryan O'Donoghue <bod@kernel.org>
> Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
> ---
>  arch/arm64/boot/dts/qcom/msm8939.dtsi | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8939.dtsi b/arch/arm64/boot/dts/qcom/msm8939.dtsi
> index d4d7b0c9206c..71e22584a46b 100644
> --- a/arch/arm64/boot/dts/qcom/msm8939.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8939.dtsi
> @@ -1627,6 +1627,29 @@ opp-19200000 {
>  			};
>  		};
>  
> +		venus: video-codec@1d00000 {
> +			compatible = "qcom,msm8939-venus";
> +			reg = <0x01d00000 0xff000>;
> +			interrupts = <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&gcc GCC_VENUS0_VCODEC0_CLK>,
> +				 <&gcc GCC_VENUS0_AHB_CLK>,
> +				 <&gcc GCC_VENUS0_AXI_CLK>,
> +				 <&gcc GCC_VENUS0_CORE0_VCODEC0_CLK>,
> +				 <&gcc GCC_VENUS0_CORE1_VCODEC0_CLK>;
> +			clock-names = "core",
> +				      "iface",
> +				      "bus",
> +				      "vcodec0_core",
> +				      "vcodec1_core";
> +			power-domains = <&gcc VENUS_GDSC>,
> +					<&gcc VENUS_CORE0_GDSC>,
> +					<&gcc VENUS_CORE1_GDSC>;
> +			power-domain-names = "venus", "vcodec0", "vcodec1";
> +			iommus = <&apps_iommu 5>;
> +			memory-region = <&venus_mem>;
> +			status = "disabled";
> +		};

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

in case you're going to resend, please add a \n before 'status'
and make power-domain-names a vertical list (like clock-names)

Konrad
