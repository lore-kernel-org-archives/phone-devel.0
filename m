Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB4F72D836A
	for <phone-devel@vger.kernel.org>; Wed,  1 Oct 2025 09:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759309785; cv=none; b=I9dZsr1EC1UnTHF3MDrsY342YIp6jRfYMSENSxUyCTYhmVUSB0UxdXD9jJVrVWk0oM3gKvgVgz+L3DKN47igdSR5v2Bzxp4CY8tnmfhMBVVi7u8OLWXe3N6YblCHccTMGvSHsd4YctDVTA2+WIC17zmiO619hvWj1ZFVOenEsLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759309785; c=relaxed/simple;
	bh=+HHYGPpeXnQ0rGeEdDhox9U3tmQQlISDNk9LsTxwKAc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lcZm8mC1LBQHELtJeXPcv5/GQG7DEn7R82oC2wE4aTmp/mpU/rfOKEUpPBVvb3K80Rn550tBlCEQe2uCvoRbe2VulweTx9yNQQgzgHzp8+B1HFBUcbooqrg/d4Ag/ibpYoQxMCAPmsbgKwkUHyBK0Wrnnvpf6fmfpdQKC8XXMhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LblUTOVj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LblUTOVj"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58UNKTiZ030563
	for <phone-devel@vger.kernel.org>; Wed, 1 Oct 2025 09:09:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	E82Q1fCgbKcjzYtoOPTrK6nTOyj3o0Ro+K82VDmaYY0=; b=LblUTOVjcOqLonBy
	2cQKJff40rYAeoJFSq9eJZ7YuIYVP+VM0ScLRQrw3i4Sv9vWi4Vnp0EifNVFCE2t
	rFCvItBWeOsUY8Wp6zktnHCdfPmtUrARF+XjFwyUR7zP2che1QzbTAbNzh23YWvH
	nOHOgBSeGV9taMqX7bdYlu1uqGefGQQ251T6lC/1O23gmGp+PkbtFXvDVFQTQrJT
	XBl2JWyYkFkl3lRWAy0nvfdheJxjeqzAppfx3LGSpXhoaOSKzzZselR9KywWYEFd
	FHMoSdceqnyh/NbFB+unjbbx+Ck7y6z2bGtYHZLpfusRzEj0/x9P5VvxsJJDTlNs
	wgGZ+g==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e8pdkqea-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Wed, 01 Oct 2025 09:09:43 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-865c7dee192so118274985a.2
        for <phone-devel@vger.kernel.org>; Wed, 01 Oct 2025 02:09:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759309781; x=1759914581;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=E82Q1fCgbKcjzYtoOPTrK6nTOyj3o0Ro+K82VDmaYY0=;
        b=Y9xuKrxWCKMobih4+xTmBTUjL+zPuoAZWvrbaRTAG9eqE5lD479DUBzC/W23c5cnXj
         WT4615f3tVN5zbF8oN7rvakfG/A9b1dowESU4ksa4f6Fqwj9Z9UwsrFmd/EvKwHnpyy0
         5piuDa5m8H9OmlNgAxhZJtv83ZHcoTEPB10c2K+YJJ3Jen8XE3o/rrNanAY6XAGFiIxa
         DBMSOeAkBZhlc39bhVXWgKAJMl4GBP46zXPcnBxJKx6x5aLIeye8GBts8Yudqe901Tac
         5SfvYbTZMogC+vB7Ln4Ah5BXAX0OJ3um/Q6p9HG7LpJIi7bg+eW3BHHNG0ts4wzDOVSf
         MbaQ==
X-Forwarded-Encrypted: i=1; AJvYcCVzji6Qqkro4T6KBEWxOvSdnIqNKLT2A26a2dKVhGg1XKQI124hXlobhek4ZopdlpaOdGKLA2wKlTrXVQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxy42X+TKulnhCnS3JdIPMfc4PlZaOUK19i61fZmBoFih5JO2yx
	w3A5MwdAOMpiheHfZVutcWE48BymNEO0JICwTieZyNXEji1BOd8Ik7yCFg9bz3n/k6ngRGjR1Uz
	nJ4e3AHIkEJUaR+kEuMgx/h65ImK3wCoSdo9dA1fxHRjiKFU5edY6WnWYggAaao+38w==
X-Gm-Gg: ASbGncvDCRUZsJA3KexiUAVZluG7kDgfBnleFAxUDD6gxDkN2i+Qfk7MlCb4zhbe2oB
	KUS7RdRiirTjKzlGSzqd9sdYE2TuB9CT+kLSyfKvaJw1QeLrIZGZF2T7hDuPk1Q90Q8Navu3SY9
	OXOnhfTQY2FZ6P9rYbfWHg52X3QL4kJcfGV17ySR76W/zrnYPCBboQt8H6IvUdinmDnfJCoz5TG
	EMjcqWwpXxe4tERNsdjMtYW+6UxjcPQJdbP2JuLGTS8fnhiAjfPJxaRVm0/aY1IWoTaBzIYFUmB
	p5nzANVM+c5nfjbRTLnjU9Y6d8pFIjXQKBYZPCOihp6/cDZJpz4KomQtxyYry8/vtyK/mZIxWj2
	LRF8QElj2hEqSAzld+mkDNw3/ZFY=
X-Received: by 2002:a05:620a:1a03:b0:7e8:584e:2de0 with SMTP id af79cd13be357-8737191ad41mr268178785a.4.1759309781391;
        Wed, 01 Oct 2025 02:09:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGOW58vPwLh+tGQM7l3TzbUzpwSb/oYqYaNv7HwrefqZNqpGLSvcy5yrdvHVrhJZhiT/a20UQ==
X-Received: by 2002:a05:620a:1a03:b0:7e8:584e:2de0 with SMTP id af79cd13be357-8737191ad41mr268176885a.4.1759309780852;
        Wed, 01 Oct 2025 02:09:40 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b35446f74fbsm1336674366b.51.2025.10.01.02.09.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Oct 2025 02:09:40 -0700 (PDT)
Message-ID: <38c70e06-f7bf-4ca6-8fe9-2a4012017cff@oss.qualcomm.com>
Date: Wed, 1 Oct 2025 11:09:37 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 10/11] arm64: dts: qcom: sdm845-lg-judyln: Add lab/ibb
To: Paul Sajna <sajattack@postmarketos.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        Amir Dahan <system64fumo@protonmail.com>,
        Christopher Brown <crispybrown@gmail.com>
References: <20250928-judyln-dts-v3-0-b14cf9e9a928@postmarketos.org>
 <20250928-judyln-dts-v3-10-b14cf9e9a928@postmarketos.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250928-judyln-dts-v3-10-b14cf9e9a928@postmarketos.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Sl3H2edW51qJR7LexyNfsG0IoO4-YjRV
X-Authority-Analysis: v=2.4 cv=MYZhep/f c=1 sm=1 tr=0 ts=68dcefd7 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=Gbw9aFdXAAAA:8 a=cJ-VQTIiB2pID4zbgQMA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=9vIz8raoGPyDa4jBFAYH:22
X-Proofpoint-ORIG-GUID: Sl3H2edW51qJR7LexyNfsG0IoO4-YjRV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAzNiBTYWx0ZWRfX0qoR0+u9F10b
 vD+h8BEBNX/plzv6c/xGG9mbIasgmCH/mIG1lB7rX8oaltAqApbNqhbQfl1yC8Ihw6wUKRQ0dno
 LskbsU2kbk3F1QRbxZfRK3ACKXUUbx8BGuoZeVE6ywe00cFcAPkQxsl5F8LzagTIJO0T8o/d3WQ
 MJZ3dIFae/jRtUSrrJqwVjRlF4u0/RliiwnmII9FY7ROM1lcTGvK3NRd6frwKR/KDyiXw39yGU1
 gkrx6IyOmY9KNkUSqFPWNiDYBrpb/N/o83gV4ce7OTFubD0zdycktQ6aTwjMCsoFbCe5I34SdRi
 U7nQsGr+RCzZI2EyIVfiaIMDLb7MYcLaNg43KB4mKarou6HgDkeS67BaJ9Rfu30U91nsDJmNCso
 swXlyP0PgBswu8zTeYv1W934Y6CEHw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-01_02,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 spamscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509270036

On 9/29/25 7:05 AM, Paul Sajna wrote:
> These regulators seemingly help the lcd to work better

Electronics generally work better when the required power supplies
are enabled..

> 
> Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts b/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
> index 3106fdc9b679bc6a43a1a490c61b73a63003f7e1..9c3662a3d93e124667474753e0f11d0e98698aa0 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
> @@ -48,10 +48,27 @@ zap-shader {
>  	};
>  };
>  
> +&ibb {
> +	regulator-min-microvolt = <4600000>;
> +	regulator-max-microvolt = <6000000>;
> +	regulator-over-current-protection;
> +	regulator-pull-down;
> +	regulator-soft-start;
> +	qcom,discharge-resistor-kohms = <300>;
> +};
> +
>  &ipa {
>  	firmware-name = "qcom/sdm845/lg/judyln/ipa_fws.mbn";
>  };
>  
> +&lab {
> +	regulator-min-microvolt = <4600000>;
> +	regulator-max-microvolt = <6000000>;
> +	regulator-over-current-protection;
> +	regulator-pull-down;
> +	regulator-soft-start;
> +};

This patch will allow any values between 4.6 V and 6.0 V to
be set on your phone, with the kernel defaulting to 4.6 V at
boot and staying there until (if?) any driver requests that to
change.

Your panel probably expects a *very* specific pair of voltages
and any deviation may cause unpredictable consequences, including
magic smoke if you happen to go over a certain limit.

You should most likely hardcode that specific expected voltage here

Konrad
