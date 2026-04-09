Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABEDE3A16A0
	for <phone-devel@vger.kernel.org>; Thu,  9 Apr 2026 08:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775722642; cv=none; b=hCXJ+LOVOdzvF73yYQTKDgg7Yb69VlMDMU+oPaanFPk/XnwGktgfGHFnXd2Zwhygr0yGakCd/Zs75HQhXgoggRAdTfutbi3y7JQhQ43k60Kkm4oCxN/Gug7E8Rc0Cpsw38u6WvyzvJeQSi/RjkjpwxD87+Yulpg/2nTmEIpVXZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775722642; c=relaxed/simple;
	bh=totwhvENBNF8lsaeZIFlYkhK0o3Zzv788+2z2zVDsxI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Uw3Ch8Pce0wJL4zJiNLBNHOwpdqVKqt7BjuNJQVOL6xE+s4rgu9KZ1LAESlC/rAkGlIWKQJKWgR27/CDMLv7oK9xu0CDy+TI+Z/2y6ComFlsN1vkBVVXkDPWGYhmD/iiEVmFq9EbT+ksaxwnDuZxjS5ggoE+j+M8CJxz0HadOGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q7Nr9jCU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RonBwuNu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q7Nr9jCU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RonBwuNu"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6397mUeQ1073261
	for <phone-devel@vger.kernel.org>; Thu, 9 Apr 2026 08:17:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BxSRWVJFhTfuq67blrqNau+EN28Vfo5z6oDilIcjPXw=; b=Q7Nr9jCUxLE1/9Cv
	8+8t5mFirrIPGARD34c7q7wvTtvoBuqgUeJJhhdHu5wlwzy14r4QUl/Rc68bLO7/
	oLnkT9imU2Nvh/WXejsNrbqxNxbHbq/a2wZ96hW16aH9RVF1uedupq4Pu02YdL+N
	18B1iNfogLMTijIRHVHxNcZgYKGGP1LQ9MyPapQofNhojAQtK986UBfDk2PT6XEZ
	LdVG85U8kbp/kuvLAq5KihkTX2FDLcc0Tkb/KIbeAI7BgQLZdZsq5yzMAFrvTS9D
	l5OwFyMZEasRgx97wjZQC4LCvzO4+bJLiFfHYI+hHjcapEwXimBUM1prHU5ku60h
	UouXIg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ddtb3b38j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Thu, 09 Apr 2026 08:17:20 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8954b9b5da7so2603776d6.2
        for <phone-devel@vger.kernel.org>; Thu, 09 Apr 2026 01:17:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775722640; x=1776327440; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BxSRWVJFhTfuq67blrqNau+EN28Vfo5z6oDilIcjPXw=;
        b=RonBwuNuQbAlfSaTsVsn3q++8CRlamQciXuAZ2S++vQmsusAjRIvrqsQItszdAeiny
         vo73vMupaMGG3seng/wZKSovvvxQfa0c2BRRISrAYNpKyjkovK9DTcCJE+HkdTo4XeGk
         2QR8nKZxIB3oyxnW9kGDYwIYN8QSGjBmZSKhpzLPxrR1HiL3ccWFIt3+TK9M3PuGozHg
         sOBcUy2huipm6jgbUwn6YpDA8xYE+pPE7EiqGK6T1Hy4uhTyoid2aOFS0qnlaoFXgb3Q
         Afclo2QRmyaB2UB7QbPVtKw76MQ9RuJXTB7NA1c0ui9+/9XLsxTWRVHYjf7VH9k3eEVJ
         fCXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775722640; x=1776327440;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BxSRWVJFhTfuq67blrqNau+EN28Vfo5z6oDilIcjPXw=;
        b=AyduCKaYBZe+Q9cdDyKggzXS6S+wsW8kNOcljGeJi00LuthLbmdhUOAByhlI/PCcOb
         ba0z8mKIJfsvGazeIbVf1QQpIKpGYqXkx4EmIfaaB9LR1Wf38qc0eBw34N5kuTLTmhq8
         kBAD5UXM+UY2hBXvBUcJQdVSzJ60JcsMvY3oyEyK3HsQQeAztInI9SZnxCb5dcjCJFo4
         t+0ZCpe6VupUm2G7+xMFddEZd8GnjBOKGXNAISsJ8NXKRyBL0ja/DeZLXwGABbJlu1rR
         72+yG1m1fTVDf/kOPc2QrzzAakGIpci25C77BWcCY0RBoNwnyJf97i8aMcsvw+tDgonL
         NExA==
X-Forwarded-Encrypted: i=1; AJvYcCWOVSETGm3kPpOpD3fL5IClHVNLHxynCzqdZOSORy5Ll+SROwGPiNoXXcG2OFy5nP2eO/yrX1jPKUVMag==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+93w+CnHNFoTW+loy5GMb9D1+JLlZDc8WaCzN1zPLZcE6RVtR
	ZL5gNRNVa7pCqQ9SjAFE5eE6mOEjNzbSNplSf3u7ucX85cBFnX1zku+h2RfUVbRH0O1dKT42jT2
	M5UD+K75omCQ5CK4tkIF6+H5lfXY1N7YF8f9gdn95x97HZ4ISXyTUg6CLZUICoSLmxg==
X-Gm-Gg: AeBDietbfMze2wkMvwzng8L6h1e0GGwD2XwaQj5fEFxJDcQ/puRe2HjLyUfRXg50Dnk
	pTpyD5FN4W0I/AhgUbIwgOY074GSeb6a2gWo41dBeJh10ka9ds3059bB2SYZlPS+UbujBvup5gv
	bK+ibB/RFdBpZY38gSeUpKcoMCKO2RIGkCjaTDYjDWZX3YqfYoL/dNxJSZtDSv4emQYeQGrDirR
	ObOHHrAbOzajufYqLIU4Ld0UevIUi/I81nR6z2yksN8H85GOTh8xs0P4UUGJvFgLVxQ7kePvssC
	IO+7KuDRYHSYp8008WVJYpARVJZa3gVhQisew9fxMdLvD+jXY1kIxgXMvwfNDHOPbcyjxZ2DfZb
	YkBtCg3EP58d4/P7pCmFhqTnT3ejApMMlPWaHmI4dvmkvfcGKZg8eEtuVsfLpqlEVtWV31HFSSq
	rMbto=
X-Received: by 2002:ad4:4eaa:0:b0:89a:732e:f805 with SMTP id 6a1803df08f44-8ac640bdf61mr79343586d6.7.1775722640099;
        Thu, 09 Apr 2026 01:17:20 -0700 (PDT)
X-Received: by 2002:ad4:4eaa:0:b0:89a:732e:f805 with SMTP id 6a1803df08f44-8ac640bdf61mr79343426d6.7.1775722639737;
        Thu, 09 Apr 2026 01:17:19 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3c99fc09sm721173566b.17.2026.04.09.01.17.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Apr 2026 01:17:18 -0700 (PDT)
Message-ID: <4c5a5f3d-c1c9-4b49-a045-3c2994adefc5@oss.qualcomm.com>
Date: Thu, 9 Apr 2026 10:17:15 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net 1/2] net: ipa: Fix programming of QTIME_TIMESTAMP_CFG
To: Luca Weiss <luca.weiss@fairphone.com>, Alex Elder <elder@kernel.org>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
 <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260409-ipa-fixes-v1-0-a817c30678ac@fairphone.com>
 <20260409-ipa-fixes-v1-1-a817c30678ac@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260409-ipa-fixes-v1-1-a817c30678ac@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDA3MiBTYWx0ZWRfX1yZUubjSYL+s
 4SskekpySZWkVXtqO5kxIA7tCUBrF+RV4EGpSqpjCSdLwFiG2F5LUnKqO+BN3V0zoyn+nV8ajt6
 Cy5iyTkWed4syzLr3nNaYwxMe9Cq0xNjd+z+Y8/sr4CKSV80k566/wXYZob/skPjzZX19i5OpTR
 oVMcg49pkDFU1iRD6DDVKsXg0V+yVb6WAAhh13hNxXrefuOA+gSqrn2DQvtbqqQmxjqOXx1qxqI
 BR9sNmBW1ntR3/AwMmVZEiXsAFEWKHk1rIO56BvDmTQJu9FM/NGVfVkQZpQhpbdMJxghLLZ8OQy
 oOt7/bqlR/aFXRX/lQlq+G5a2LofVUTLXCbkMpK1QS1ZmJ+QZ1Q/fGpGTdDxIx6wSo+VxQWAIB6
 myl058NSe7vCKcN7mg7cgK9ttSewY2qGGBuU8i4bVo8ozcfw4bikBXddj2q6muCk8ubD/bX2Lz9
 eviqZY/dpeB0MAmjyEg==
X-Authority-Analysis: v=2.4 cv=eKIjSnp1 c=1 sm=1 tr=0 ts=69d76090 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=c92rfblmAAAA:8 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=3mzYr_IWz7iMthFhtCsA:9
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22 a=GvGzcOZaWPEFPQC_NcjD:22
 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: tba_OIQHb69ic1p4Ff817GHuMAcrkfzt
X-Proofpoint-ORIG-GUID: tba_OIQHb69ic1p4Ff817GHuMAcrkfzt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_02,2026-04-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 spamscore=0 suspectscore=0 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604090072

On 4/9/26 10:13 AM, Luca Weiss wrote:
> The 'val' variable gets overwritten multiple times, discarding previous
> values. Looking at the git log shows these should be combined with |=
> instead.
> 
> Fixes: 9265a4f0f0b4 ("net: ipa: define even more IPA register fields")
> Link: https://sashiko.dev/#/patchset/20260403-milos-ipa-v1-0-01e9e4e03d3e%40fairphone.com?part=4
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

Ha, nice!

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
