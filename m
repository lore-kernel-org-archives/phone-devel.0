Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4470F32A3F0
	for <phone-devel@vger.kernel.org>; Thu, 27 Nov 2025 10:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764239630; cv=none; b=RRL1DDpdo5nVDK8Qgzqzw/ZMuGB0wfTsFflxxcMqAuSQ96ZNiACilhChojDQsirGEa91FnCaUuk+wNxnMMT54RODJMP9RVK4TTmyXhswK/2EMwZsi/3rsDnlBG4JCS5za2uttXq03EHz7SrDMb76uhLR0bGOmGVts/g8MscAxeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764239630; c=relaxed/simple;
	bh=XzC3a3C4R33fBBmDNjVhR7TgoZfSi9FXszBwbv8ToTg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q5+qQtimLHHbJpzOjn0zLPY5pm8I/i9pVZ0qj1o/UmTMDyu7lYU4+9dQGM8ezipk/eSuorX1EEc1LwJwE5iaIqKZVqTBfRiBGA7f9H+PrKKpA6nkQtthEv53zckPFZyx/BLqfqjW3ery/qUOfsxYsBZTc8/ltbWCEyUMArJcSLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZttGB2ie; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cIpphmRu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZttGB2ie";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cIpphmRu"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AR9bCJx785215
	for <phone-devel@vger.kernel.org>; Thu, 27 Nov 2025 10:33:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CokDp5tVfSWP9BVDb0GsLQqjB/Kyd5QN+NkNGa5QMi0=; b=ZttGB2ieuwdSbx6t
	agpInf3Ip++k+NZ8Jtt3QXajDbYv5XY3MuHIyO3GoaE8itF5BNEyDfClU4G4OieS
	fRojmqDnLmO2xu3P2AmUYesCqIRo0LSHFzf0OtLcjQr+FVeLwAU29HAKX3ZNnhR8
	VBvcNaoj5Xv58kUvl6VDKaAvLQiz7JykEwT+mQ4uz2scw3b4ktMoV2TfuWVm/mp4
	VsLmLR4Q87IClXjJrS2PZryzcVyxLBqvDtXd96HX/kBOh9tCaafHK+BATS+gQZWT
	PiSeeG2KgPoM8+kPKvoKbxuJQjgwE6MobOMKG4tHA4U6mhjBz8dXy/91VotBBmCp
	3USCPg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4apm61r5vw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Thu, 27 Nov 2025 10:33:44 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b227a71fc6so15468985a.0
        for <phone-devel@vger.kernel.org>; Thu, 27 Nov 2025 02:33:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764239624; x=1764844424; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CokDp5tVfSWP9BVDb0GsLQqjB/Kyd5QN+NkNGa5QMi0=;
        b=cIpphmRuoHbO1yZsrAaxEOxHTFw5lfbdrTRUb226dr6SWCZw6l6WCuW6xlU164xdQH
         VwNZV+Tbwjhp2QhdsIXnVEmlEOAGn/itCvbEty6Kfg2iZNe+f0JlwNBlcqRDCmo8W00j
         VV13njW12sjYi8EaJq6gCCSypL47LYdEF7TeiOMObmDS5bFFsNzHOfgH92HuL6SUIO96
         J2F+8w6hu8/eyiL6pkh+aJUQopRdMl2sJMs+mYeGFrRw2TUmeM6indinzW9PCUAAd/Db
         UqduxbjSj5C7PuE9NbZYrQWGwFuItS46q0tpCR3zI65lUu1TY6v/riujxqZtsRzTQ6+3
         ecqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764239624; x=1764844424;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CokDp5tVfSWP9BVDb0GsLQqjB/Kyd5QN+NkNGa5QMi0=;
        b=DhO2HymB68/rZsgfsC4c0kpU+gowfwqp9YClwlNp065H3NQGnt/yZUBuugWnnLsvRi
         6u8ObMjcupPNE5SXpSOY06A9ZEXhGSasa83mcN+BGknnO+nH6s2Wiz6PMoVA0/wc1cG6
         dnyY2CRjjm//V7GuzsB0LWA7m6wMXH4IOVphueGXPEoyqMxQ7PzP4jW5+62D1scH7IwO
         mV18t8WO6M7Jp9ysqSZbWEtpGobISgFFD0hH4t3PDBBPluKHFH8fNbxiL8UYw0FuRUSb
         PCXKpLCfvN4OLvlTdQ2zznMSUIi1hOZXTbZdlKXRBwToGGzft4BZfoJiWjMwfPASnGj2
         wmjg==
X-Forwarded-Encrypted: i=1; AJvYcCU5o3hEaMAAESRX+9CZjIX93l5fciymqae5koCOksthS8T0stq3IAqztoeTz/PXZ5g8JcHLvYRMJHZIrg==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywge6giROX3yFEVw0ylUprygp2iLU2ininoKWIDBocbQ7KTJy7P
	Bgub1juAxxypBPMtUFrNwF73/2+feUkPSqen6n/OjLTlU/JjCMHk7kHfqn4QlkYasniisa3LCfp
	wXdSjo+l4twKTGuflrjnDLp4ICo3qJJV6FOkNTT9Hbm/nJ7SCGKr4NUgx6lJo/nfv6Q==
X-Gm-Gg: ASbGncsz5Vw/oitN3ohcZLOUEtKxdXIzlJYOEd9DLlffITxSOMEPuvD92Z6atKkaKfE
	WZnvjJFLW7xnyarHIiULfstDkTvjOkT3s/KHNviFj1Qx1NrLmj/ONTCiBhGSO0Zf28KKojufiMg
	kUb/dm9wGWzHrBEYFuIgNB9YOy9oYYGxdMYQLZXdFN8GXYLwdYbUMZmEFYP5yb5b7o4voQdJlTi
	cgw+79Kq0BSbr91/ninSEe0JBGtRTSBf2YWUCGXHwcAn4ZxMHcs47R6s6mwjAwpIPilQ+ZpGRFn
	09G9YDq42ZXzGMuEJmLds02utbHcjYoQ/H9zUdeGgGchVZpmjyV95kzQrKqlulYIS2CYuT/DiBT
	M/8k24htLRbBcglITEBNLZLvfkoydeVgIvYq1gd9lgyKyAr/zqP4s7t3c1uHsnf55O5A=
X-Received: by 2002:a05:620a:40ca:b0:8b2:f090:b165 with SMTP id af79cd13be357-8b33d1e2ec6mr2312807285a.4.1764239623708;
        Thu, 27 Nov 2025 02:33:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHifeZrYTwgAFAMOt+YXtO95UYll55NxTNDQ6fJKo8PEXgJiioUmfQnYzjjkQSYnHETB1t/Wg==
X-Received: by 2002:a05:620a:40ca:b0:8b2:f090:b165 with SMTP id af79cd13be357-8b33d1e2ec6mr2312804185a.4.1764239623268;
        Thu, 27 Nov 2025 02:33:43 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b76f59aecbdsm117793666b.38.2025.11.27.02.33.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Nov 2025 02:33:42 -0800 (PST)
Message-ID: <f7bfaec8-cb98-4254-9779-dc48a9409bb5@oss.qualcomm.com>
Date: Thu, 27 Nov 2025 11:33:40 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sdm845-xiaomi-beryllium: Add
 placeholders and sort
To: longnoserob@gmail.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        phone-devel@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251126-slpi-v1-0-c101d08beaf2@gmail.com>
 <20251126-slpi-v1-2-c101d08beaf2@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251126-slpi-v1-2-c101d08beaf2@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 3J-gXPhe0Qyxg1ihsT3TiMKECjAfCAF1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI3MDA3NyBTYWx0ZWRfX16x63Io8WuHj
 G1mOvPsvwaF1ghrqEyClJAPWkkxNjpJpZKojT1erKHdKOLMO6KiO0L/Y4goLNFjvTOqBgZjEXCF
 MS5FIi1VPLVY2OrSEGoLTq+z2Iy4scdjPKfEKq1w9bcbvvLm+1fYbJ9vyYuu8rgu8KLvwvlqltY
 /P0OMdMp0EyB4vZOooA5LAN5xcP0fAAajM2ZmIfp/Sw+JLaAYq3kxAMUG5wiu/msH4ZGluLXhsv
 wR0FEXoCr5eALmAzzPexxBiu6oLh7M3qIGgQ1zbtZsCtcRuCRJHXoDzm1KtA6h0IugykEO/lhw2
 thwSnlsiA/vMxLz1dh0a3x+hS4rvH1ZlLCRDMo/tdJvhQ6qhJWalsO096EaD9u+WyWjOByZehfE
 FLcUXR5hFG/hjNfxuVO7KwbXTneDoQ==
X-Proofpoint-ORIG-GUID: 3J-gXPhe0Qyxg1ihsT3TiMKECjAfCAF1
X-Authority-Analysis: v=2.4 cv=IciKmGqa c=1 sm=1 tr=0 ts=69282908 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=pGLkceISAAAA:8 a=2_5gyxQJgtZ_QaTgg6kA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 spamscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511270077

On 11/26/25 1:08 PM, Robert Eckelmann via B4 Relay wrote:
> From: Robert Eckelmann <longnoserob@gmail.com>
> 
> We know these devices are present, most of them are supported by
> downstream and close to the mainline kernels.
> 
> This is very handy when rebasing the integration tree with the support.
> 
> No functional changes.
> 
> Signed-off-by: Robert Eckelmann <longnoserob@gmail.com>
> ---
>  .../dts/qcom/sdm845-xiaomi-beryllium-common.dtsi   | 23 +++++++++++++++-------
>  1 file changed, 16 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
> index 0fb1d7e724c4..0b219d0ff451 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
> @@ -227,6 +227,10 @@ vreg_l26a_1p2: ldo26 {
>  	};
>  };
>  
> +&cci_i2c0 {
> +	/* IMX363 @ 10 */

It may be useful for you to add 'status = "okay"' here, so that the busses
are accessible, and you can poke at the device with e.g. i2c-tools

Konrad
