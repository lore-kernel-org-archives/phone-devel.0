Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C37C332C95A
	for <phone-devel@vger.kernel.org>; Fri,  5 Dec 2025 11:51:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764935521; cv=none; b=TsxtFGHY0oKIPPr3Y3hf65A9cJ6dgvM+E4wVrwI4z77l8B4o7xn0dMUpqx9zWflj38twMi/cv+URPgXuildzXCsXZItsJyLxZwy7MykseTWoc6ylJNE02mMNTjOOjYg7/IzCTwn07Oj1iJrYuxme4XMU96lb3TxBPDnB0lsxOjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764935521; c=relaxed/simple;
	bh=4FEPkcmPQydsXKd3bDt+V/OwWf+GUJUg2bHRhHFd5JM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TTUDHzGRAs67BdD+7aOcUNTZyqD3NuIWAuRrr03058mhSN/hS3DGQFRm69IGQHwHTGtwMaVTzbhsjLj8DdAbrlLEWGfEukqVhi9RAEYeBSdZoQDjmp9Po9EV8bw6zkfmBUpACcOCxWM7MCrqtiGo+PNC7ZzOxAMhVoaECv2vCvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b0DTEAv7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gtCPNC8Q; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b0DTEAv7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gtCPNC8Q"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B54K1BG3643724
	for <phone-devel@vger.kernel.org>; Fri, 5 Dec 2025 11:51:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LZ3MnpeLSn5m9T5UfL7r6oeLnx6zH4HXGLQHnpAL93s=; b=b0DTEAv7S5bKt3pD
	9HLKjFgX1/R2PR4BzPITB+QLzNfXc3GHO5u1xDuD03ICJ7pD2TtVOFaxUl8hYd6s
	LIFcUdKmZ51Kv5q2tL4lx+AatgdC1pM9prSbp8Hdit2bnh7BiJIYD5RmSyUC0VJC
	vWf5qH5UF2SZOTxTDUON1faVKk79pXvsMf9YPvZIHq/4Z7RiadaWHRQT8V7z3Myj
	UKF3gxJvJfNi6ORYlxsBAO6Wrxbh2x2ZxtyYT6KbapLSbi3rJCshd7v/u+aRkS1L
	wWiIhlFyESnNpbFw4CkQyT56jbNJ51PGFvWOTN4gRDiG/yexity+1kcVEG+YUVEA
	OyY6Wg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aur9as6yw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Fri, 05 Dec 2025 11:51:50 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ee00f2b7d7so5131181cf.0
        for <phone-devel@vger.kernel.org>; Fri, 05 Dec 2025 03:51:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764935509; x=1765540309; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LZ3MnpeLSn5m9T5UfL7r6oeLnx6zH4HXGLQHnpAL93s=;
        b=gtCPNC8QmkxyLCAfa6P3SzXP3vIIoSEUfuX7e9HXX5x/z3n80MVnDXQqqaSj00aKJK
         kn1ZZ0tE2DDKLhl1EENY2UHdkyYaDFE9WW2N/Xg+VhIx/mL7KrBfjjNiZatZdk/ykfpj
         j0xmn0rlWQ7YcpFa2W4kCZeNd7QvSaYs883vDP90faTgfQxxRoF9EEod5Iwz9JnAFEze
         zHvcKSNRkIffW2ZYx8mxMLZAcBBY1HgjuUn0aQCXz7tshxPV9d40PW69lhuv7eJwKAEE
         hi+By2C7Ks9MwsA7d+u8R+vJu8VA4ZV8uzo45rZHKiMwalnBXqELEQTzyXb1MPLK0tsn
         knjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764935509; x=1765540309;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LZ3MnpeLSn5m9T5UfL7r6oeLnx6zH4HXGLQHnpAL93s=;
        b=mtQ47gFDeBlnN1Ao4BzAvrhAlxhzD96Fei7VMkHZ4iM/JjubUZhUuAFJ2OGxWb6NFb
         4Fx4bOdc+5LM8v3r+KyI4Tg4zoA0kSQivXrKIzMA8t1E3quYNTi24AXNFLiIzkTlLMr9
         OjTYm8j5TJQu+bu5zWXUFu1whkqIN7rz+iWnOdzDfVcYoA9iCgWrzTE7SD0tIpZOnYC0
         QvUUPvo1CgxhXfDPnfYdPsPIuU0V6Lbsf3okqU+UCxa0e4OfDeG5/Vlj7ZO2tu05sW4x
         9SBy/H0I0Ozb1RDwb4AgRZoMfPcR1mVWunJfuEhNsb9T/lFWdYMSFvR3/Pc04wScu1x/
         lLgQ==
X-Forwarded-Encrypted: i=1; AJvYcCW7pbwSiztGO8PbJz6IA04wVlEA+gNkxmYO3BlSt3Xqdr0lpI6ogcNUyq4zGHprrB5BLaI17W5JV6zb0w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzoIk4CtXbOQvqXWphDtz4jUMDfCVOVCmCXSjejVbLfJQYnxWUz
	GDK6DrwxTJ4MP3v60V4ILrPYfePJVS+4LP4UPGlIyiiy1mVyH0H88NG7vMMIDvnd8FafwrpW7Pj
	JR4l1DckPO7kLdkrFBqfXYYWr01fztbI+mPCT0pbwGZGW6VUEmcoURfOEWq53ffaX+Q==
X-Gm-Gg: ASbGncufSVi79Yi6E71VWmNTlrsompU2cO25xNMUvzqTI1NpJkEb9Dopoi7j219DoQg
	/HeWHxBSiFknIkDRgS1f1Qqk9B+q3vgC+zRiPZdUFdbJJ2LWD6WM9a4BFcVhYp8ghy5n1weg4+6
	fucjX9DuBmzhWCj+aZwd7EzzkuGV41PfRlclIkKYuq823pthqaCykoBFd9nFIL4d6aBSiJ764BF
	3hzIEMcRBt+5jCZGmOUrxP58EkY2ed7rGBlIEQpak113my6kh1wUFJO48P5NYFo5479eAmRkZ0C
	lQYrp38xchY0+/2BkUJjZwxZaOYUw0qRsYgPYADLhgqmH7IuXlvajh9gkHE8s2jklnx3ij2+vj3
	lmexWPAEcQGgCKolxmXyQdJ3Q1yh1vIv3fIsLcKXgegBPHhyQVc0aRfUp7Orkfupwfw==
X-Received: by 2002:a05:622a:8603:b0:4ee:87e:dedf with SMTP id d75a77b69052e-4f01f47c206mr58946511cf.8.1764935509398;
        Fri, 05 Dec 2025 03:51:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEYijUVYYzQtkzHyt+odEkZ8dzACllEwFv8T03QtxlHJQATGGl85vBbzl0MqQcf2F48ONcYRA==
X-Received: by 2002:a05:622a:8603:b0:4ee:87e:dedf with SMTP id d75a77b69052e-4f01f47c206mr58946321cf.8.1764935508847;
        Fri, 05 Dec 2025 03:51:48 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b79f445982dsm362646966b.1.2025.12.05.03.51.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Dec 2025 03:51:48 -0800 (PST)
Message-ID: <509d5d7d-b7a3-4dc9-b3e6-c3e52abe040c@oss.qualcomm.com>
Date: Fri, 5 Dec 2025 12:51:46 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] arm64: dts: qcom: msm8939-asus-z00t: add battery
To: Erikas Bitovtas <xerikasxx@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org
References: <20251121-battery-hall-v2-0-d29e0828f214@gmail.com>
 <20251121-battery-hall-v2-1-d29e0828f214@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251121-battery-hall-v2-1-d29e0828f214@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Veb6/Vp9 c=1 sm=1 tr=0 ts=6932c756 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=69Il93vAAAAA:20 a=pGLkceISAAAA:8
 a=I6SptnUO25vYt0rnpQ0A:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-GUID: T_x4IRRWbZj9kaEDr-OqAOLYTccVH103
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA1MDA4NiBTYWx0ZWRfX5njcaHfcalPJ
 0vshxDYhXx0yzGen+IdNaohvP3vK/cF3s3KSttlI1ez/Cv7am1dbnP9tRmZI4c0wttVsff/IoKo
 U7EwPC4mM5uqZGT1akYe0QKN8xDwzkpGXQ/GPToSwGbO910i7BKzeGa/CzOiijPi7MZDSASoXXz
 VivFgOrFCLJ0Ot4XAeo2M/79GlbT38hJHbn2yRt5XIf1Yk6qAxN/KdcWaVAW8EvCi1Hmbj4DV0s
 qgtNvVCe1SIzW32td9LZLAPl6KyGvkMgPZ3vF1n/Nqa2fF0krHTJQNs25poko/HTgO9z6fLi2l6
 UTnidLJ3Wr4JzBbuoV/2TfI4n6EDYLLAyiA/eyYlb368U2Ktc3Ny8xL8CLvK/XbXTRFYi87U9lY
 o5g89M6Rw5Hsp3ekGRz/pl2TXfQUuQ==
X-Proofpoint-ORIG-GUID: T_x4IRRWbZj9kaEDr-OqAOLYTccVH103
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-05_04,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 impostorscore=0 adultscore=0 suspectscore=0
 spamscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512050086

On 11/21/25 12:10 AM, Erikas Bitovtas wrote:
> This device tracks remaining battery capacity percentage using voltage
> mode BMS. This commit enables the pm8916_bms node and adds a battery
> node to track its capacity. Battery properties were taken from the
> information printed on the battery itself and downstream device tree
> for a battery named "nvt+atl_3000mah" [1]
> 
> [1] https://github.com/Asus-MSM8916/android_kernel_asus_msm8916/blob/10.x/arch/arm/boot/dts/qcom/ASUS_ZE550KL_1936167_3000mAh_3p4COV_VBMS_Final.dtsi
> 
> Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
> ---
>  arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts b/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts
> index ebb548e62e02..b58f0a04abfd 100644
> --- a/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts
> +++ b/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts
> @@ -20,6 +20,25 @@ aliases {
>  		serial0 = &blsp_uart2;
>  	};
>  
> +	battery: battery {
> +		compatible = "simple-battery";
> +		device-chemistry = "lithium-ion-polymer";
> +		voltage-min-design-microvolt = <3400000>;
> +		voltage-max-design-microvolt = <4400000>;
> +		energy-full-design-microwatt-hours = <11500000>;
> +		charge-full-design-microamp-hours = <3000000>;
> +
> +		ocv-capacity-celsius = <25>;
> +		ocv-capacity-table-0 = <4372000 100>, <4306000 95>, <4247000 90>,
> +			<4190000 85>, <4134000 80>, <4081000 75>, <4030000 70>,
> +			<3984000 65>, <3930000 60>, <3884000 55>, <3850000 50>,
> +			<3826000 45>, <3804000 40>, <3786000 35>, <3770000 30>,
> +			<3753000 25>, <3734000 20>, <3712000 16>, <3693000 13>,
> +			<3686000 11>, <3684000 10>, <3682000 9>, <3680000 8>,
> +			<3676000 7>, <3668000 6>, <3643000 5>, <3600000 4>,
> +			<3542000 3>, <3462000 2>, <3340000 1>, <3000000 0>;

I was surprised to learn the binding allows you to specify the OCV table
for multiple temperature points (your downstream provides -20/0/25/40/60)

May I ask you to fill in that data?

Konrad
