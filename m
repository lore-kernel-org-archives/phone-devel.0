Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16B7A2459D2
	for <phone-devel@vger.kernel.org>; Mon, 14 Jul 2025 10:45:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752489961; cv=none; b=Jq71A+7UfWuSCdsdg8d/uzqzrOlg6x8Xf9ln284C4AxG6+kA98hrUBHw+RV1hpKK4ZUfTi5HnXOaz8ug+SrUhrL8udkM/HrtJrqQdhuEGEppB/jNSRw0WbDdITd6AP5CEdem0Soey/+5nd9NaV9ZltG7B2dv4rlYa7C+DPj7rcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752489961; c=relaxed/simple;
	bh=GsngcRU9ghE95V5sobt8zThiAoxS3bXWswd84ZP946Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m9ZGEI5a40Nx8n+QhX32jDJzihH0ZC/MKSS51GwE+LX86MdHQDK4Cic6hYA6HcnqW1hyMXskOR+Yp+jqyS4NneE1Ad7gb+FXDGUfXXiFRcjihsrs0KjtLwnR/VFSf3KKnhj5sodKTvtgmzf2/4ZdZ6rDZG2HObWlVE1s9MsUiFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OjgikyEb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OjgikyEb"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56E9bBi6024672
	for <phone-devel@vger.kernel.org>; Mon, 14 Jul 2025 10:45:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NvkMX/SfCrQy1ThgqRjv/mjGrsXTIeTx9QKU6pkfYrU=; b=OjgikyEb1mjfDte1
	wtP/hpabasFr7CEflySVgYGJm5q0nSReES76WtUDsAjuVaGWqBaidYYc+ixjFAyW
	B1c+hS+/h5RiQtj9mbC1P/SNWh13uGAsktQ+25BjHlJO2Yp713g1b5IHML/EBtSm
	7GzjdcMCTjs4eqzESvGMBglzsukbovmXSYVcRUR95hJqGozKR0o4Tq+VKiIzkcFL
	d2fSI2y5SYSoWoqem9sJnwPZTiCFACI19+lhnsk1Jfkwn0Ld6LVvaYjNUlAeoL8U
	XKNcKYWWEsO5Gslfhw/4ku1cVVXMLjTp13cMhyuFWE+l4Q/IgOCH250QMqJZNIJm
	+gON1w==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ug37vfcn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Mon, 14 Jul 2025 10:45:57 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ab3ab7f74bso8724451cf.2
        for <phone-devel@vger.kernel.org>; Mon, 14 Jul 2025 03:45:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752489957; x=1753094757;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NvkMX/SfCrQy1ThgqRjv/mjGrsXTIeTx9QKU6pkfYrU=;
        b=qYtUWg0xzws/FFJVxgZsypfktycpy/QKOgF20WpfQ3LT7IohGiOHYyVC3NVw/ow5eC
         R9dO4FNgs9BHcJBmSGk4ssH8EKrC3sgO0nzGxIZWqxm18KjuEwfgh/cF21J2mHrmquSh
         xgSDk3e10mtjyvCx5raWusMbK3pOetR5iBQRPbXl4VpkYSgvFPCL2PGHLzJoEbzEhpnX
         nG7LG6alXQT9biWr7OQtOnATOpF2X7VIivYAWYRCnq+F+o/8PIs2jGg1N4NdNm7UTVrh
         lBWKF9I3eJowZmLtYCtu+as+p/6k89WaUTbhgXX2z+8TqUwGo1X9SuuTUU2LHvck0vk5
         nBSg==
X-Forwarded-Encrypted: i=1; AJvYcCUBvonwlBMvDqiFk/dc6FrCuxMLShwXvxtPeaP3G5xylpJOzGeP8ZHzUu//OgC4Wyop7YcNur2ILH8lAg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyXGjIKwWgTmwPCpSZ4/SAKJy5jDnu8dEFEg3dXQkveuVRYy6gg
	Rrg1yX4+SvkNg3SJEHv6C6agxfWzt6W9NdoUl8k1Fh7+s9yjS4xrVE/V8ErWO58EeV85RWrcPCx
	G7N+M6pQm9I/O3sw2xTPkJ5qd2UjfZGbikZ9GgWsJCzIXWKhNMLfNzwIXj1HVawxtBQ==
X-Gm-Gg: ASbGncuYcrEI9V7Y9XNdm0uGQx11s3/4sw1VjzPf3/SnZQlAbEtp+IWJW8vbm7Kmrar
	cOGEThcLmOP9I49qvUql0bJOcJjiWdQYZctS5cOSgMnkIwuQ7cIHrNwmD+/AVFBelvu+oSHnI0d
	ild2cYBEIZJy8G6LXI56n3o0pXS4lzGLUAuIrwXq3WGPyNq5xvMyJW2DCmFDrO9BnNb/+oqPiQd
	3+Ir7NY2iO1rAHXJ1iqRcKtfrMBqPKVuxouTYUaXBIqi6uQHQpV/riicV38mc4L+4as3RYYGc+f
	jk7o3Ut3sPumokbsyj7rcpYOFE2BqcEYwiDDQ8BQeG4Uu0JaQdLoz13qnh3QNcg7tBGTJnbCZuV
	7LlxLB3rpVY3PBsdPN3gd
X-Received: by 2002:a05:622a:2308:b0:4a9:a2d2:5cd5 with SMTP id d75a77b69052e-4a9fb85981emr61407061cf.6.1752489957151;
        Mon, 14 Jul 2025 03:45:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IELfiE1hbm9W21cfQCQReZLaomvmcfube3hO9vSP/hdiOgPjCPkHWjuKc+mXLxmKJJITonrVA==
X-Received: by 2002:a05:622a:2308:b0:4a9:a2d2:5cd5 with SMTP id d75a77b69052e-4a9fb85981emr61406911cf.6.1752489956642;
        Mon, 14 Jul 2025 03:45:56 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e8294c15sm803864866b.117.2025.07.14.03.45.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Jul 2025 03:45:56 -0700 (PDT)
Message-ID: <e2b92065-e495-465c-957c-ac10db8fec09@oss.qualcomm.com>
Date: Mon, 14 Jul 2025 12:45:52 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 13/15] arm64: dts: qcom: pm8550vs: Disable different
 PMIC SIDs by default
To: Luca Weiss <luca.weiss@fairphone.com>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Vinod Koul <vkoul@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Robert Marko <robimarko@gmail.com>,
        Das Srinagesh <quic_gurus@quicinc.com>,
        Thomas Gleixner
 <tglx@linutronix.de>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Ulf Hansson <ulf.hansson@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org, dmaengine@vger.kernel.org,
        linux-mmc@vger.kernel.org
References: <20250713-sm7635-fp6-initial-v2-0-e8f9a789505b@fairphone.com>
 <20250713-sm7635-fp6-initial-v2-13-e8f9a789505b@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250713-sm7635-fp6-initial-v2-13-e8f9a789505b@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE0MDA2MyBTYWx0ZWRfX8g1qnc6HBUnB
 20t92f/KS9c2UOzF9VmrfBZ0p8my1gcwaVU2HKWhxf+o9n5un2dMVO/I9y6P9SIn6ahV9wGY4Dm
 cVgb/DFlwJVrmVIVuvQG3WyFYC9zXinXfVqK6HVca1ArzfMoCtQ1AoydK/RYuQ1truBFfFRLoav
 H/rfaqUOpNMkqjF8f2GDFykfW92+C9NmG+O2uHDX2YIkF8wxVkoVNT8oicuqdqufYV2YS3HkHut
 klAp5wY2ijnItGxExYCxBx0PAmNdNHCK0yphMjmb2e6zXBNpsBO264w6y3JpttD7UDuSuJmbLD+
 3WOH/igKhJPo+BBV1E9G6TthpOyRdsIy7z4hZcffZIhIxlJuPyl4UXYoRhxvf88wPv6VwLLsu6m
 woBgX0oybtoPWBF7MEFc6J5Xhw2Ho2bmKVfvtBYq5BqEEswvXdwQhJlFyjssvRSdwqEfIRVa
X-Proofpoint-GUID: CSYLgURzeVr5rHum9GgbjcRR0JVxRDLX
X-Authority-Analysis: v=2.4 cv=SZT3duRu c=1 sm=1 tr=0 ts=6874dfe5 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8
 a=yhMgBbtfkmf45w4ReXcA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-ORIG-GUID: CSYLgURzeVr5rHum9GgbjcRR0JVxRDLX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-14_01,2025-07-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=743 mlxscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 adultscore=0 impostorscore=0 malwarescore=0
 phishscore=0 spamscore=0 suspectscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507140063

On 7/13/25 10:05 AM, Luca Weiss wrote:
> Keep the different PMIC definitions in pm8550vs.dtsi disabled by
> default, and only enable them in boards explicitly.
> 
> This allows to support boards better which only have pm8550vs_c, like
> the Milos/SM7635-based Fairphone (Gen. 6).
> 
> Note: I assume that at least some of these devices with PM8550VS also
> don't have _c, _d, _e and _g, but this patch is keeping the resulting
> devicetree the same as before this change, disabling them on boards that
> don't actually have those is out of scope for this patch.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

thanks

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
