Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B0363B9D81
	for <phone-devel@vger.kernel.org>; Wed, 19 Aug 2026 14:42:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787150563; cv=none; b=cKwXUtLesrjZZ0/X56KR6O7AomiLIscW1Y+P52JewzMLPGcmitKa7jGbfTG2nxgBFkeT6JxkpB98jZfCg8X5Ip+xWO/h9tCIPRWg/S65MOZJKEBsich8S1AQpY9Ei6CaLuGdtrhYJtRhzulMs0ok7TEZqYC7Y/avW+n+QSLNJLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787150563; c=relaxed/simple;
	bh=z/zZjs5bOOaK1GOv8zryaod1Cgmr0AddL3vgONRM1O8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BOX90ZAbC6RkCk9raN+NWD0EAAjriczGFO26+GeHlR4aNF381UQd+bUuX7EjSW1pXs2WlB+NHTg0jb2PRzRKFBipOrpsrJLEoiQ5J+wO2sgeNJpgTotLXETOqWNNY9ch1QIiejJEOAfsCWjynIBrR9STwsdVMe+SlBgjUi3XBkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j3wHKl6V; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YU/weOYg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j3wHKl6V";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YU/weOYg"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JEbmgf390428
	for <phone-devel@vger.kernel.org>; Wed, 19 Aug 2026 14:42:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tRQxt4GSu1VAaSvVfJScpbqr50/voI1PXeAYPBdH90E=; b=j3wHKl6Vx3Y+LhI+
	5jiRcgyFDMbplJUeiVH7vUbgO2l+GeS1Is07ur+zqQK1iaLkgP6G+oTUDOWmQH6+
	etY0RqIPg2CRhEX9FHxdARyf9fpFFkslLspAagPjlWR/uFPkuLS27GWoGu6SumAD
	6er/ccSbydPxGMEa5pPARzKSznkWbIQXqCnV7JAE1fe+jsYlyw4gC7SpqoBKCGLY
	XAC8G6dsav5XNnoVzLgmsj/bjBZxCsxG42v660n3Ld6OBQ3++4kb/KkjYK1owspl
	sf0cIXd/CXkiWfTuVev0rwkmgGSJdWylOSpckQ40jZCLaCrqX9DFySzwcVZxBQrA
	Qy5mxA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4yfjkvru-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Wed, 19 Aug 2026 14:42:40 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-930a312222dso19292385a.2
        for <phone-devel@vger.kernel.org>; Wed, 19 Aug 2026 07:42:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787150560; x=1787755360; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tRQxt4GSu1VAaSvVfJScpbqr50/voI1PXeAYPBdH90E=;
        b=YU/weOYg5Z6ebJTDG3wx6ypA05cA1IVKk+Ur8jBnAkJYDgaBqrxfx1rAzQab17PF6+
         e1g1dQ2owgag2P50000GuE1/249BFV6xsWovYeL241QZGQJtiYUZc5cGIMuc8sx44ZlY
         sXKAdRb/jPuIeDPaBXNaxo1eeuw0c/EP1n4SkuZRfGC43fsWsQtVa3gOzpbrt52DTCpT
         MYLiSKhycJyVcRKOBusXQoUdn38M+L3Qz70Xbf3duQLu4GO3JUQyaWGiTE87j/yqQmzQ
         pRVimSKq/plWxeQPDJBuTaRskWRpxXRnJ6CQG9/BqGqSzlnBW6K2h6VGCdnHoITWw3VS
         ugzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787150560; x=1787755360;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tRQxt4GSu1VAaSvVfJScpbqr50/voI1PXeAYPBdH90E=;
        b=hYCKq/3dRNHeJMvIQAug4vq83636gN2wk0YLkcZMovwwHqZcI90wZlJDxhyJ5KbrPI
         QERDULKLvkLllRUEqGe6teS817Jt2z/jCTAGMLVoXw5w/UYO/jV/Ucc15+yRiAIUmJG9
         vuQKHRpnABvVLhMfvlOpF2QOBazZlxksHulpcIHdoCiwdpnO5Ov8iR6nHbKc+cp6fiPT
         uReXGqSMOkYpQdfjTBPOFBvQnBil/bAgiXn5HHhpldOOxSnN0OZA5aN4rGXI3tpFyXbV
         8eeUYuVDkxnzPrD8ti/SCUK0zTYKsn8vKe5RVFb5UM0YhK3/dFFtdnLhNGg5xRVDf3yK
         iJtg==
X-Forwarded-Encrypted: i=1; AHgh+Ro5tDIw56Hw7efPapbFHnUya48ObGzgsiJ86jOBaNVbL21IEHnFRZxitoTv8nNv6+46nEYOmkGlb4/Cqw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwG0Ox3/k7Tu6ggabnv714BNE41hM06XxYft5MTkXss9xccHn8j
	kFsUM7QQayLtvuXmJcKjYrG6h9LV+qoPoaFpX75zcvPjZmEi/SXJ+JyjAEhhG2ywjiYwL/4Nms0
	AAEKwKd1EzZgLHE5PhT4dkjgKvyUIXBjoC7e4HEfF9yKHT8PIM00B02hZpMFe9h5z6Q==
X-Gm-Gg: AR+sD117tQTAVRGmV/woWegG+dhyxSY+S6f/YzT8ZG4PSboh5F2QiJXVPH7plz3nNyv
	xV4frSFx0zjqGs9dNCyB0Fhs9l309lIgqj/vWTvZP0BfyR8IbmqQDE5/3hCnK2CL1eV0iGE3aAB
	LtSngAMOrv5FvyjIAbIo8BKT+EVxgVXyBNG/UBnfMZcsj+Z6WGm1FnVLICIWezwxBDKYo8bB8+k
	kljzUdqS2n0b4CRS+F/wQ4hfZ2BxRAY6di0RZ/umTmkaasDxMtIcK2Ypr4pnF/g1dKMHehzAWv5
	0VJfkj+7rnqCqFvZi6UQJlLC15y2aXnjQsT5ERFc9mJABXno0oPDQ5etqj17+JKdezpgKVh4VE+
	7q3WRI7DDeMvd5G3Nt/rXfNZv
X-Received: by 2002:a05:620a:284b:b0:936:5ad0:fdae with SMTP id af79cd13be357-9371e7e90f4mr323477385a.4.1787150559708;
        Wed, 19 Aug 2026 07:42:39 -0700 (PDT)
X-Received: by 2002:a05:620a:284b:b0:936:5ad0:fdae with SMTP id af79cd13be357-9371e7e90f4mr323472085a.4.1787150559150;
        Wed, 19 Aug 2026 07:42:39 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c243c38b379sm90642266b.39.2026.08.19.07.42.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Aug 2026 07:42:38 -0700 (PDT)
Message-ID: <40e21b3b-edc5-452a-a2b8-015ac2412709@oss.qualcomm.com>
Date: Wed, 19 Aug 2026 16:42:36 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sdm845-oneplus: Define touchscreen
 in the detail
To: david@ixit.cz, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Marcus Ramberg <marcus@means.no>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
References: <20260819-oneplus-ts-quirk-v1-0-0cdbcea195a2@ixit.cz>
 <20260819-oneplus-ts-quirk-v1-2-0cdbcea195a2@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260819-oneplus-ts-quirk-v1-2-0cdbcea195a2@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDExNCBTYWx0ZWRfX1CbWhLi1gdKR
 7N4vgfLcvug3SofXCz8/i7KIlANCYoPj1zSdWOTewiU7BNlRqMhQgVIJuROFCnoY6IIJA4icDKJ
 VWuaOGPOZEhPd8s56l95WGaPQ01206kGXdZe+T/uC7Bjl9V8SmZxNZiNHRuS4pRKhSvXJvBLRL9
 sorIhAPEi9ZJs1V7Ul4aWb8mzDepenExiK2/gUJ4RrwpMbqebW9ubJwcYa6d01KmhlzRGE3IRzS
 pNThXIHrbnRrSRS8Z1SfYH3HB7ghE3K+K+5Z4d7Xhz0Xf5MKqF2qihv74ndH1J5VU4r/o1Bw+Ne
 +lOAlSJWh7DibeSNKfhWX1Ct2t2Lapg8OM0RiXJgio/+BIOnLN9oSrysqC2pXPg/VtCCS0MjUyR
 CcrJPVjF6+t1HCEiXCaQvfzvzX7W6/HPrm1GhFM1mGOSxxJKQo4TnxKOMBVhh9+c/o7AWzUIefs
 ZgYxv/ZOJ7gt2JpkWsg==
X-Proofpoint-GUID: _AySUI-7-f7OkbxFUX81heQ9wt4TSwy-
X-Proofpoint-ORIG-GUID: _AySUI-7-f7OkbxFUX81heQ9wt4TSwy-
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDExNCBTYWx0ZWRfX65VULpuiJk4s
 2ZSEEGnnys4hOeX9Z/bitgY7ExfbPxTgfvACUtNog/yoSldOTM40nNYbRvGXD9mCirNYHK5GDle
 zxlmZosus3aDPjn16Qyh5Cw9ifFj47A=
X-Authority-Analysis: v=2.4 cv=Sb7HsPRu c=1 sm=1 tr=0 ts=6a85c0e0 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=ea15iDvwudEerf5hAZwA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_04,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 impostorscore=0 adultscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608190114

On 8/19/26 3:56 PM, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Once probing, aftermarket touchscreens report touch over 0..65535
> which is unusable. Be explicit in device-tree to avoid this issue.
> 
> This change should be irrelevant for original touchscreens, which
> reports proper values.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
