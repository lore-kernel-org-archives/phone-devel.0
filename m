Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F1433264EC
	for <phone-devel@vger.kernel.org>; Wed,  6 May 2026 09:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778058767; cv=none; b=Ipnw5FNCTQ+Urvafno1oztlyPLsCyCkVwiKGN/QlY/Njopt7Fxly+s8Pu/UaapDp7cPI9HnmHAzcOI5nySmGbNFRulYBVrvwR95vpkQIweIDbb+3xMsFskuJzlGnodRajT+kevqdJ+obQoygzqDK1YaJVRCtPCXj2E9yUilaFmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778058767; c=relaxed/simple;
	bh=LKYZUkcCpsEGxqu5clSz/v06FaXbrAaDfBJeB6zn8PM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rYNigJnViTWVcZxOjSsEkEfShMbnS0bece5wgpMHNQMXD2g3y9ubQxcz8TEKePTzvGUr00Ew79cmm2ij/pHZPam/iTavZsNm7R/nIEtMsE+k7uAFF2QtQldw0mOtjXFrfvx+SkYj9yWs0OOTO2GAJQD9jRyglk5g4XecZ49+7iE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XnObDoAL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MbhAhGAE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XnObDoAL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MbhAhGAE"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6465qutf2581342
	for <phone-devel@vger.kernel.org>; Wed, 6 May 2026 09:12:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HW4GtVL7H2//3KHfNW4EVTiMZ7Vh3ddHH+POLA1mHgk=; b=XnObDoALF18hvUry
	gOB5dQhjQR/M8vW04bRwE5I8iZmWU2sF7ne0nKXJQp30xr3TKp8hbv54EJWqeL0G
	15VqWhoDRnE8fDg9MgHtwAPLH56aP7TJ4omG3LShosf8EInIGi9GgEJy1VCTlxD7
	E4JvdiGrgIOEjsxEN1qiC9UxgG2PGcZIEo/YFGLWOfIS5EH179Dcut7UWsLpz4mT
	jLgxFa9TCcuO3gqJz3MJlJG7C/GVbBWs+9YgZ9RESJDh/giveKt/Zl92GpQSB+ho
	Pd0pUUcvxUkpmk3JXL82r+u8m46CDyQDb9dzBhEec/ZDVuHP3kJmHOUPAjEl53Qu
	jVTFIw==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dyyvw0u9k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Wed, 06 May 2026 09:12:43 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5755f6c9bf5so8470e0c.3
        for <phone-devel@vger.kernel.org>; Wed, 06 May 2026 02:12:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778058762; x=1778663562; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HW4GtVL7H2//3KHfNW4EVTiMZ7Vh3ddHH+POLA1mHgk=;
        b=MbhAhGAEQVm9vA3JBInBQw2NleibV96bjIq3EXc9QFd0gNxW06GyRzPusRVw3h5UrU
         yIy4Q7DK8t2Z79LHQziJ+eOf1z4XQ6td2/wL7ee4nijOJrvTMwBINPsdmzQVxWQ9Rmpq
         QZsNV3GFVFn1yTjF8LlpcfclWaoT0+EWIeo1Gy5LaWeB61La0wktO81z/4NvuVqPaXGb
         9ujGfx5qdgtxMnx5v7nC5ncrRz5VYGANlaQIndNaV9hnXdDbT/IrhnmEWBhx5RhcDJKe
         XqzR6YsQhTxV6/n1GHYvOwCpeIo4qynZ4bOy7+1venQcN3DVPxLnaedy2v3Jfsz2nkdn
         aLyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778058762; x=1778663562;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HW4GtVL7H2//3KHfNW4EVTiMZ7Vh3ddHH+POLA1mHgk=;
        b=NrQZB15ynDigNyyY1QxUYBeX8GnGZK3ExsSAIrTJ/rGIFiJNKdNMBLD79NrdGaSM+I
         r/w5lEOUroX2OMUFXQnQ8qGqMAhfDn5thobIG90Jhc7UgToFv+vIo7KykcPqfg+s7b4g
         j41cUO4Hq7Ns02eGteoeHTyyDezwCBtqxvul7TCewx2GfCfrewNPkvXZ0ll0eHvmJXAj
         lyAg4X6w2rIseJW0PIogtDai9pIQAZQGTbK3F/5ZYl70uvJ2/RFxaNkvClOMAUb99Mt9
         4zPS/+lEJWF19ltxhzcwbhq2Zuw8bR07vU6rLWLgmQhEfjqfOGxbHNnX4JwOT2Zl9Rfl
         +6TA==
X-Forwarded-Encrypted: i=1; AFNElJ+Cqb5hoqMT5M7bvu2XWLtk8a8FK6W7o/4D4O/AZSUoH7tXkVUr8mKrLZb2AecKbVRREUTKTngZq5pZhw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwRjgUJgHNIFeIK/B/XxCKijdFI5eDauceg2oK1Ma3gnSVwc6Hh
	KxpUWbm3HpUnFjZGc0TU2/7sRcR2Q36LdCTimtvaa51VL5AiIpadoug/rVf6J2fUTvSTlfmNN3y
	kt5bhefw7TLwGgcYCaFj05EQKGUM9bVWtIOyJk+MG45mPzJOkSvu9/s7ommrRwR7zN8czZnBZeA
	==
X-Gm-Gg: AeBDiesDUD+GaJYDXy1DxyurRMA8wmnPGdMDfj0NFcgF4CR/6yO1VTi+KL4ckVGIjql
	ytbRPOnklFRa5IZ8/TQ4biHa2FlduIWzdvQ+27TP8NZKdiOg3orm1ikhKjSK2N5QwVW6kcvG1fD
	qh65QmCR0A87xBrOmib4Ujo6Vtup0GfYDhsOvggymfrG4iOLDpXb5cafcDE3A2R2gblV478YI4L
	e1d+/GgDk1CF81dXfcvM0CqX+syRSBXoAotVCy0n3EflN6x6bxzQoKbesFAMDSsyPTJCjbSNm4r
	/cKHoUkKeKCB2qtBaW8RBsZ1fWiBoD+BYl/PIbA8LNVk5qR0eW3lAKUEtkY62MwH5iqPhioVFU1
	YQ6owmkJBWpCPYMrPDENc4/7/rLZmyfw/y4X5d3iEP902C7oTUBSDdJoJmBGe21PhgL5moFianK
	xBrzcPewJpmeDPJQ==
X-Received: by 2002:a05:6122:2319:b0:573:abb5:7d39 with SMTP id 71dfb90a1353d-5755d027d20mr163184e0c.3.1778058762077;
        Wed, 06 May 2026 02:12:42 -0700 (PDT)
X-Received: by 2002:a05:6122:2319:b0:573:abb5:7d39 with SMTP id 71dfb90a1353d-5755d027d20mr163179e0c.3.1778058761689;
        Wed, 06 May 2026 02:12:41 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bc55b17c5f1sm60531966b.1.2026.05.06.02.12.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2026 02:12:40 -0700 (PDT)
Message-ID: <b031b46e-7ee5-4289-8034-83a547153e56@oss.qualcomm.com>
Date: Wed, 6 May 2026 11:12:38 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sm7225-fairphone-fp4: Fix address
 in fb node name
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Luca Weiss <luca@lucaweiss.eu>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260505-sm6350-misc-v1-0-0b9efc22690c@fairphone.com>
 <20260505-sm6350-misc-v1-3-0b9efc22690c@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260505-sm6350-misc-v1-3-0b9efc22690c@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=YYCNIQRf c=1 sm=1 tr=0 ts=69fb060b cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=y3nCg1YZ4dlb0M9iUO0A:9 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA2MDA4OCBTYWx0ZWRfX+8Vq4BLiCxhb
 X8LhgFV0dtgPRdXRe1YhiRlzcQ5IuTmThfbRfMmHoLDeum7sPVl6CNc+QmlKP9Re6z/2vnH5q22
 3jqfy8rNbdFK7Ag0RmmBOhIwDekKNVLNkuzE/zswcfkKfM8qv0kfGMvDnRjBrxqyoYH7KEUUIQR
 FfXMjG4vshIRHTHPXMJKAGRpuftnkEK1mCAJEsI6Gz4eQTxBZYNp8KgAHuLgGFnKOf9QvqiFqOf
 9SjmaFSQliVZ9vX/8AdHVUVr1VgaIErt67l5Oa/SFQ7whoqkWOpv+NeE0YPULCeibgIXSvDe0Y8
 3GOURyXvB6Wa5Ulhm3QLvdgLu8oasLFi+a8CFyBox3BSJTR8DBkAw1nc+xl7l9F8olcFvt2e5Ac
 BUdDDA9Gpgh/Y5AEx2CA4ukmu8az5cHPFepVWbF2sn7B+Z3StOd3mAZ77y9aCg+CwQuamrKTtrQ
 sFsZhq0NEwcRTdWQSIA==
X-Proofpoint-ORIG-GUID: jMXGDOpwn6fMX0JuAtgNKRA61-f7BwA0
X-Proofpoint-GUID: jMXGDOpwn6fMX0JuAtgNKRA61-f7BwA0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_03,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 lowpriorityscore=0 priorityscore=1501 spamscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605060088

On 5/5/26 5:08 PM, Luca Weiss wrote:
> 'reg' is 0xa0000000 so the node name is missing a zero. Add it, so that
> the reg and address in the node name matches.
> 
> No functional impact.
> 
> Fixes: 4cbea668767d ("arm64: dts: qcom: sm7225: Add device tree for Fairphone 4")
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
