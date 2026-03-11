Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAE253C73E9
	for <phone-devel@vger.kernel.org>; Wed, 11 Mar 2026 09:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773220498; cv=none; b=KcaP7YUtiXBvLdAueL0b4GDmn1WkTPsEUZBItwlYzMlMiVnSna2oDWQp3mMKDdJGswAlfjkbSDYkTuDmTy3oGXTTGjrBeQ1uiGwlAArkUM15+7UfErgx6ly4WsxHbX+hle6jmYBQxQGfD/WU4IKMa69hWX4MEkYk+YDsN6GzEGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773220498; c=relaxed/simple;
	bh=HU+C+P0O8jbGCZhY9O/WUb0qwktGd/zUZZfKwgYwewE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k6HhH+n1+pMCH3RZRmrxW4VgoUVqweSfiGw2x6WhAWwvl+yvNTPK0XMsxynN/FJzo75VFYf68ke8/a8iKsKokCXU8B69LGw2BFjw6C5HOBUitEIu54r0O1EBMVpKAboIl6X+VEdYyKfokd6WDJdtt79Gv0bwTaQAlFDXz3oQAmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hNcu58fm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aneBZEaG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hNcu58fm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aneBZEaG"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62B5NnfD3418255
	for <phone-devel@vger.kernel.org>; Wed, 11 Mar 2026 09:14:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	M1kE1FXsuTlVpdfgBDygRuHNKgg5kM5MBIa1mWYDfGw=; b=hNcu58fmdp48B7Lt
	GAqeW3V4O+0ohEkSHUnrqp1j14oVVmrA6a4UUBFjkXK3qDj2Pcj4p+tZqzRgmlfY
	NwuJQtsUdhW9EmI5NUVPcb9ue5UaajZLBc+X3YD4tW10nzkX1NxomRDdk924Z8/I
	4OBHlGtOA4oN31RBhHcoJgmuNTRh3HesBTnx6E573b6qsI0nCje5ilJwd7yGiku/
	gWZ7j0vfNC16wRWktjhQwQKlNscshiKiCyP0RFPyfFiI2TmF7KbA5QBS8WDXnAeN
	V/cJ75jWw7KKwJtvvTDiZ6D2xDfB/AVQvuGoZ84IVrAihINMoaXYqLxf9khdJc6D
	5+ax0A==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctja2c934-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Wed, 11 Mar 2026 09:14:46 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-89a5b38affdso12403506d6.0
        for <phone-devel@vger.kernel.org>; Wed, 11 Mar 2026 02:14:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773220486; x=1773825286; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=M1kE1FXsuTlVpdfgBDygRuHNKgg5kM5MBIa1mWYDfGw=;
        b=aneBZEaG4D23xRf2U7qRU70VmHmCIIOKhLnARKoWTXbIuLwQQvWUIlc7yw7dDrVHhB
         HnnrtakAMCTBsRQx8MHtyRdR9cFYg4m7Ur4ZFweUpYgoxQweRQj3vxaGFdyKdPHvi+Z4
         ndM0rIEHcs8zqbQrwqzj8xznYbCalN1UK79tbuU0xGJZ8XN/YWuavazB27/8a8QAi6Sb
         AMYezBKfXPczlprDYAAL7iCJkqgXL/x70EPGwYw5iUN/BpPmNIAy7HQuXsLZTPyMGC2F
         4EhGTdKa6evt97b/XB//f8qWoXECQKBLHFw4140QmTHniueyMpu1MwMY5itFyBJm2IOn
         gl+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773220486; x=1773825286;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M1kE1FXsuTlVpdfgBDygRuHNKgg5kM5MBIa1mWYDfGw=;
        b=dQ0LO8H1SaZBxBpV+ppfUprQJVnkkX8aqQPFmC3ij5eeQ1O0EW1KijiPZin19mUVfo
         PnTIpXw3JZCLnNqhJCHer87Fw9JpEJ2fMEle7a4YcaeXK/GcNDMXphgHs+Cge1NZ2c8F
         eQg6MSVR4Nzj2FP/PacvMuA01UrEocMx/WEeD3bjyoH6NZC+Wk+yYcac0Uiviogb/u6u
         0jT0Lt3N30MrKKw3A8Wq3Mi9L6aGpaaSOplU6VukyEGubXh3yjHSm6r6FDvUBOUmdn9G
         xybBC4dIO8f4DMS8pOFTo3U5OogzqgTh1sl4fRbKKEMhyrg3zcqnhMFbF2xIkA7QZLM3
         x1QA==
X-Forwarded-Encrypted: i=1; AJvYcCW28ln14LTv9yci1+G/ssJqSn0pUoa9xgkPsvV+V6hesvKJrbsRQO32oJBiDjSFAm5yoYzdmqUwWzyKrQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yys21St8MpeIu88/L3JOGy4Lg9+JqsL+SBkhRxT9vQTM/TKWYl7
	ri3A6WUBMjmF8IFJXKLghtxN+GB/qJY4cg61OUwnNUNjNGjOPJ6ts/Kd4x/9JU44d6S0BhZBtpF
	0ROxBs73DN8z/jVgC7lAAMicvobKNgg6UB0q0Fbppck/KTebs7ElzKGs6PT9Pk+knlAKLUtJW/w
	==
X-Gm-Gg: ATEYQzyc7hlfMUNFJvjcrzdyU+kiylk+iLraVr/3XcqKs6XNwYLe+qdtWgalMLMecQi
	ArE1s97yslecXHeIv++GGcYBJFMp/APQnTzJZSjRsbaJRuHEpGJkb+ipA4YrD12xAi6k3HdJe7s
	DaC/nu4hS/woKFuv/xlpNNRbFMmP2sntTN2qD6EXm/sJTR3GeCYj3jDYfXoJh0oUZNuoToiHVdv
	I+rdgcZgwkob1VY0qEkVEK8jZQefW1FGZLftOElf6swJRUwKzJ2S1zaumZuWatioxO+vaCVNUfL
	ohVeLGBAqTOVF1L8DnqCXrlDncLT7KaRjD0nJyqB31kMR3wB4C/8SOUzBqUdQ7sKvv4euWZ3dN0
	AtoSiAxfeCLkvHgkQrOnicSXb2NAjRwvb0KVodG8hpl5He8EZxOVQMat5yS72QMYyjKvhDbJUz2
	dl7RY=
X-Received: by 2002:a05:6214:601c:b0:89a:53f8:2df0 with SMTP id 6a1803df08f44-89a66adadb0mr14515046d6.5.1773220485929;
        Wed, 11 Mar 2026 02:14:45 -0700 (PDT)
X-Received: by 2002:a05:6214:601c:b0:89a:53f8:2df0 with SMTP id 6a1803df08f44-89a66adadb0mr14514846d6.5.1773220485414;
        Wed, 11 Mar 2026 02:14:45 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b97359236easm14315666b.65.2026.03.11.02.14.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Mar 2026 02:14:44 -0700 (PDT)
Message-ID: <f66b7818-a5b0-470f-90c1-8b5d353bb94e@oss.qualcomm.com>
Date: Wed, 11 Mar 2026 10:14:42 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/7] arm64: dts: qcom: msm8917-xiaomi-riva: Fix
 board-id for all bootloader
To: =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org
References: <20260310-riva-common-v2-0-3bfc23996857@mainlining.org>
 <20260310-riva-common-v2-1-3bfc23996857@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260310-riva-common-v2-1-3bfc23996857@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=c9WmgB9l c=1 sm=1 tr=0 ts=69b13286 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=OuZLqq7tAAAA:8 a=EUspDBNiAAAA:8 a=-Zrnz3ZjQlaq5mEAGuQA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-ORIG-GUID: DZXEvLpIlYFRFRZA6LZYdrtbqdxJHisO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDA3NyBTYWx0ZWRfX1fA0di4s48Pr
 s9FaQWiTqVmiN97S7VWkZ0AE/jZaTnmkFU5eaQMxnomSZZVZtpOaTIgQ1Jt+0Y/GfX9z58ka2BD
 cdbJ+0P/SX00yA12SJG4zEaP9fUpJe7PQAUUZ7ImVTAP5a80XXqGhaHoS0jE2thbkBP5b+dSTBE
 AhqjLHqVWR56dA+mxX/JZBwsUxhPaz7KotkuBePizrBg0sfd6ZfubcTyzm1Q9xj09QOLlSs54cR
 cuYxLf77CqLpv9uMIUjzKhtIvpScaB+zQFg4atQzbhMBSbEQB/o+D8U/xgbUjLsNsW9JALmFLzq
 rPmat0jWYtQXbH82bG15Ht2OKXdvGmfI8SEJ9xxvkZm5F8/oH7DtBb8MJ3LyxriENMbDR0luksw
 nBrtod99gjEu3VM7bDPj5oH5ejC8v5mBOSYCBNR/bOGDZuo5+rLPg+Wo7FwDSaf+n33lWmd4/n6
 py16g5W+n3YI+ghoaVQ==
X-Proofpoint-GUID: DZXEvLpIlYFRFRZA6LZYdrtbqdxJHisO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 clxscore=1015 impostorscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603110077

On 3/10/26 6:21 PM, Barnabás Czémán wrote:
> Redmi 5A comes with multiple bootloader versions where the expected
> board-id is different.
> Change the board-id to unified form what works on both bootloader
> version.
> 
> Fixes: 26633b582056 ("arm64: dts: qcom: Add Xiaomi Redmi 5A")
> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
