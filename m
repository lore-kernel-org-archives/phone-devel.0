Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EE0A3B7760
	for <phone-devel@vger.kernel.org>; Tue, 14 Apr 2026 09:46:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776159985; cv=none; b=YGsOek5xsvsw5hlPTQdNah8IKb9pmDYdmqVGsXk+PuiKQfFEwq3gIJq4HRrRiqIKNTomstvOMfUjzFk4zfxzJtah3jxDIk4VSylN1HSAR14D78u+DHCv7ZB8CzMdOU+9JU6NR8Q4TQLwt5fPpBt1eDko/Hnw5jA1svWc3rNfp7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776159985; c=relaxed/simple;
	bh=eIGlkgJRjXqEOrHmxxNOvdfyn1InkP3AlIpQDhMLaE4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uHhtxYqlhkWlCtq/fGDVX+4mrGzB1arwMClxVIV66U5DascRJKubWHz4/CQP4zdspNR74NtjjzYT66ZktHzi+RRQHEEkCOvtgnE1L0n/uOq/QFCv5zyh4OYZv4tj4M6y2G0uIN7tStVXK1hmvV9i8GRafJa7Awyqhk3Mw4AbBtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YoO9FuEK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a1iskETD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YoO9FuEK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a1iskETD"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63E6gU02280804
	for <phone-devel@vger.kernel.org>; Tue, 14 Apr 2026 09:46:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Jp1ReYVfH7G6wmzBbDSPxhiCdbsX5vp/GDnX91ojXgw=; b=YoO9FuEKE/xJHkZ1
	R/HBURFLYMPAPlcO2Og0Z6V6xbdBQqqSJNVoijYGZftEjmJbZZO8oUdgzNsoexXo
	ZdVy9qQVz0+sgIKdynd+VPVslzSfk4R/1GWMK93mhLQvDoEQ9spAQ6JLI1CtzCXo
	jBPu+uOcw1SMi5MGfD9u1112jfr23XGcM13BxYAd5RkM3EOaisoDLsWoygAWMofW
	9iqb9r7BHNNiO2JH/zVQwcifzafXUTMI2pxmh2YCVlnY7zYoJK7esuKmwp+tn+WP
	XoJ87S/OgXyg+jNXbq4AnjtTYXLThZDehoZsw1FDpBodXccnD9vJTlDj3NDm/i69
	hrn9QA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh86vj4my-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Tue, 14 Apr 2026 09:46:22 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8d0095b0d80so156186485a.1
        for <phone-devel@vger.kernel.org>; Tue, 14 Apr 2026 02:46:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776159982; x=1776764782; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Jp1ReYVfH7G6wmzBbDSPxhiCdbsX5vp/GDnX91ojXgw=;
        b=a1iskETDsc4gVfHD2UUfeC52+EqvpXVD3301Bs74ZmW7/m1ib3V5jmGkru5HmGrUor
         fJy5+gx39R73UVRXNZQQtWcMedBprWTzNF1kEQjU9Y0M9Q5tpr7dyXFUEnA/rrj0OIpU
         trDLNKeYNLTa5hi9ZqfUcmKesXCGJnELS8iL1dZTgYuTNPh5LHDuXzZHq3YKV2Qbtxq6
         nBybbc//o33FSUaELdRKKOmMJUVo6ChrLqfE/46fYECRqnLqdhr06mqC4Kh6EWbCd2zX
         HWoyqIFjU4hYY44HNtep7IPk40d+mdR7XLsuB8kZgkSymOo+al5b1L5QLHrO+pZwbY4W
         WDWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776159982; x=1776764782;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jp1ReYVfH7G6wmzBbDSPxhiCdbsX5vp/GDnX91ojXgw=;
        b=EO3UOYc7TQ4ZGHlwZHStkyBU0CCGE7JjkhKxniha/heLkT5NYP2Sa50FaiXd3tjtCj
         gVluPT+n9mW6jp6j67+oe7LVXyHdvB6x1V4fOosqWp3LJTRReAHzbZvAke/BYBc0u8u6
         A2cePSgx5HexPiYj9PRGXqSP/EKNahzQL35Z5vSiR+z/oiu/fCdikafi3858Gtf9dHTM
         1e7P1HfbcEJaKJba/8KObCgNl0ZZ5ZSFkEcsJ2+xkwaFSMTAQgAF6XSrQLUv2788UBb/
         EJugj6Jj2gWvg3hO6Mw62hQIzWhabdCLId92j7JWvUywyco8HI73saupLzhUR5BlJexc
         Y33A==
X-Forwarded-Encrypted: i=1; AFNElJ8NpIQBNDXgsRhhxaevDsNt1NJF8pk9K7SqXuz8suiE+vV7jrc/a7naP/CpcH1wiRzIhpl58QYbHCZSig==@vger.kernel.org
X-Gm-Message-State: AOJu0YyRDrgLTME2EPAmX/ZXpdC7qTjb39b12SE5M6tfKiJureyT3bFP
	zoySvZS59NT8CfAS1fOoPHPHIPtPrHpBfsWqoT+k4F2N1K6YdjqIao4hBlvCXr3cIImRVIaKZZZ
	BgwdC0ITw2DJBVRHiYOWmHbXmG1wpoAGooogC2AgBOakQZqodGCqQbIa+Qe6EZtNZww==
X-Gm-Gg: AeBDiesaKCGigTy92WMgK5cBSXJXsfNjWWyT836wE1TIVAJxPCRHT34C/rqe9/6Pbya
	ccRlkswTNo939xIb9ehUC8ThYaJ1PGPBojnXtxS7PGKu++ToPktLOTgztD2MqM53oDbxV9TxIGa
	4AQDWl2CkbqDPCxyWY79+3T0nEI7TzeMGfN64WQMfgSx8mSXFmlkMS5YFtAVqdS3BLbvB/lVr9z
	9IivgiNHrCPyYW+2c+HBZg+xd7oiyA2sYFHG2l+qSiSpmihtQhJLIAbcULM1nUANDOTcpX4J3MR
	YwPYMK/q8mdFThF3OfopQW8bLkFMpsSuzlHcUaZijrXgd28Nf6S8tv/DTXHIEvgPXOGYJLlONRp
	VET+vO9JV7sCwfyk+cRNDAtyD8sg6b+9JO7nGXtfMK/xTWm34XB7i1Lt8W4FDn4CkrowG2zI8qM
	TQZxf4B/qjXsVXGg==
X-Received: by 2002:a05:620a:2902:b0:8d5:ddc3:a3ab with SMTP id af79cd13be357-8ddcf4b4dd5mr1581610585a.4.1776159982138;
        Tue, 14 Apr 2026 02:46:22 -0700 (PDT)
X-Received: by 2002:a05:620a:2902:b0:8d5:ddc3:a3ab with SMTP id af79cd13be357-8ddcf4b4dd5mr1581608585a.4.1776159981723;
        Tue, 14 Apr 2026 02:46:21 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-670eb258a99sm1951183a12.15.2026.04.14.02.46.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Apr 2026 02:46:20 -0700 (PDT)
Message-ID: <d53f1499-0afc-43e5-bee9-ae76df3c6910@oss.qualcomm.com>
Date: Tue, 14 Apr 2026 11:46:18 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/10] ARM: dts: qcom: msm8960: add SCM
To: linux@smankusors.com, Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        Rudraksha Gupta <guptarud@gmail.com>
References: <20260414-msm8960-wifi-v1-0-007fda9d6134@smankusors.com>
 <20260414-msm8960-wifi-v1-6-007fda9d6134@smankusors.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260414-msm8960-wifi-v1-6-007fda9d6134@smankusors.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: A8veO8CAOxiq_eEnRfSN3bW8DQ21d6ZQ
X-Authority-Analysis: v=2.4 cv=cffiaHDM c=1 sm=1 tr=0 ts=69de0cee cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=wxLWbCv9AAAA:8 a=pGLkceISAAAA:8 a=O5woWLlMtrWFXwMO6pUA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=QJY96suAAestDpCc5Gi9:22
X-Proofpoint-ORIG-GUID: A8veO8CAOxiq_eEnRfSN3bW8DQ21d6ZQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDA5MSBTYWx0ZWRfX0rxiVOtFAWmT
 u3g4VSd0DR5y5vfIpBDcMHVmYn52s3IYHTTLiWay+zOK16wLXxo/SwqZQM9k/Z5XApSOFcn9l77
 qA8CYJ+8UzCW00oMC8N2pnuxsNKpk2XQBtOdIQpwGsZyNhVMfArLLHsz/gj02TDlSy31kbmHBKR
 JMdDj8GlBL8r3NOxpxgSO4bxr2k1yxV8bVsnhatCLPmS9X/03+/a95MUvV45GRWIXJDUD1mM3pZ
 XtXs4euX5bNUmnzsmRDYwrn8pBuVLMsEttZhTHMeVzQIgL3nu0bZMan1Zc7vpCHABrVPtBPrQk7
 LL6iJdoTw5wbXFWwhAsS58rMLfTP46Jrnf6i3IzxJ5PQBR41NPKKIyClhNQ5WFcy9l4qvHXa1xl
 pKHefUlegPvlrVgk7Kz+2uRPlpecOphvhn+2t426xc+Dkfyqku/WYxX5aM+nA2XqyeCYg660N9/
 diUqhLznQQYGc49bp7g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_02,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 lowpriorityscore=0 suspectscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140091

On 4/13/26 8:55 PM, Antony Kurniawan Soemardi via B4 Relay wrote:
> From: Antony Kurniawan Soemardi <linux@smankusors.com>
> 
> Add the Secure Channel Manager firmware device node to the MSM8960
> device tree. The SCM is required for secure communication between the
> application processor and other subsystems.
> 
> Tested-by: Rudraksha Gupta <guptarud@gmail.com>
> Signed-off-by: Antony Kurniawan Soemardi <linux@smankusors.com>
> ---
>  arch/arm/boot/dts/qcom/qcom-msm8960.dtsi | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
> index 1d5e97b6aa4b..bc3fd55e524a 100644
> --- a/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
> +++ b/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
> @@ -77,6 +77,15 @@ l2: l2-cache {
>  		};
>  	};
>  
> +	firmware {
> +		scm {
> +			compatible = "qcom,scm-msm8960", "qcom,scm";
> +
> +			clocks = <&rpmcc RPM_DAYTONA_FABRIC_CLK>;

I'm wondering if this should be an interconnect resource, but from a
quick grepping, I think this is always supposed to be @ 64 MHz so
perhaps not really

(please tell me if you know more)

Konrad
