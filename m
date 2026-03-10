Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9E073B2FC6
	for <phone-devel@vger.kernel.org>; Tue, 10 Mar 2026 12:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773145712; cv=none; b=J2mp7EukfTPEvYB6DcafDBjAiyBo5u5BbVFNFAuerxA81jjMVmRhD3vpyPSOqxBDNijtwoXvE7iiyknlq5sEnn+wSstZktEcR57Pp5g1GZrw00xDHt1EVt3kdzeUlmm3DLzIufkT45aM5VSC32398vGWGsjPtARIyfS3Pl0sfe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773145712; c=relaxed/simple;
	bh=W8K8DT9RRhwKV1rFdpcjXSpr21vlkIa4gpW5h3LPOBQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qxP0z5cVS5ERwIlMk6JTo88na1OR1L0YFk6xLN36I3SOwPAWnHwPBxcjubNtrkvXRmcL4ALjLVDUk0xphO5oFnEy5yK1e0zsf3kh7IllQ21aJH+U+9csFUHpZcrb93ixY2NerXm7cOMPHGZfpWn83ttMzDcj3MjXVkNz4igvIc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DLB7o+QS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ejcu0kIf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DLB7o+QS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ejcu0kIf"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62A7wIrx3124448
	for <phone-devel@vger.kernel.org>; Tue, 10 Mar 2026 12:28:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Fbj26tjaW0oauXAAKR/Dz/Bgp18J/CRra/i+8EEiKQA=; b=DLB7o+QS8r4JskxZ
	92z7o9VwiRdqJpa2StsgudD7PDbNrzTACFhbBaaLaRsc3uZZp+tI6aZyVShL2EW5
	LnnbG7PSlk4ROE/2UTEgT3rKiM8Q4/apsvwiXjxrVjGduINvyjtZJEE214vWw0eh
	zd1UbQTyuBlyRcjM4ZFFEiEzDpNexdQsGCfRrJPlpuwMcnxFwrrwknpPu7gJVfwT
	tz59E9jJWLQCVLtFz3cPjWHNPTzF4q3YvyykTgEGxXW94WCp4OiOVfiTCpH0/inA
	U7W5EbfkeYaIUU7ELmFe6rWbqBAJOQZEjRGWXAiEDcwcDJhCWdu9w0HRt/w1dwRs
	OeJklw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctfcj11en-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Tue, 10 Mar 2026 12:28:29 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cd84cfae34so109932785a.0
        for <phone-devel@vger.kernel.org>; Tue, 10 Mar 2026 05:28:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773145709; x=1773750509; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Fbj26tjaW0oauXAAKR/Dz/Bgp18J/CRra/i+8EEiKQA=;
        b=Ejcu0kIf7/9MjkgpsbTB3OeqS899qg24stHlkynheh2JpzrvGhg+BGFZO1xmbPcTGI
         wyoFz4YjCUHGvWWfiPC89pLeO+haRZkg2zRq3YyIuNhyt8ju+x3oP/YhzK3/XPYnxkz/
         PA2MlAWY7FfftEvgzWzTx+BfDSRmwG+IHq9xuGzmpA4js7KNqY4zOZLAqSjOv9gCRm4W
         Dx7I59KnB/an6gjGrrBMlwGyG8THn8bTB5qiexgT2AJRpsfZlrY8mlaEb4AaSHACntkx
         KU5NaQdkwS32lySJfhTObdZj+EsIits/so/P052iib/CP+7Bs8t+3xSfC6JsUmayFFu+
         BARQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773145709; x=1773750509;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fbj26tjaW0oauXAAKR/Dz/Bgp18J/CRra/i+8EEiKQA=;
        b=TanZq0DCMvzOm7zSmpvDXdzpn/iDEgJhzkidrLUU5PiVKIuVb1UyHFYvfhGguXz5mo
         /PJ0Px64zkQHg834gTQWFsC52VGLqjZYC0K+60/KGX/JT4Sj9IL0DQOVlnK56n2BqrCR
         AsHcGjvRZoCHa2MmFOEvLiNk90avWkh2n6vXalJekdj5O8nT+WOzF/YRFAW/j33+nFyQ
         TVHTwlYZMA9xAgCnwJdZAGOyv9pBX8dBV8PvJQTmh6yuaODgZRAwm3I32OqwcWL03HlT
         zELfich6fEgP0B/FLWZnY0hE9zmLsEkzmmHvFROjfTJIgvvPgis1ZCkJ1kfrvDZ8ueTZ
         cCbQ==
X-Forwarded-Encrypted: i=1; AJvYcCW1ZR9evbJym6zvFibEVxHuOnKgvhnQ8wtp8UVq3mAZLo372cly/BpULtruiSHgB38HNKoyVAjV9uNfiQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxAGUonJ77CYkmLCqfNgYP6oWBMjLFj0KtBuDHQmGKBoB5QNYDI
	9dykAeR18dzXXvaxORrqJJgIdNncUIKgwZNe0J5HF+tNhDXAI45QXVCrD0hRBXP00GoDcCTLmHR
	7xKs8J7ad1PBj+lJqEY8lMzvv4Vp8GEsfAp6ukl5Os0ykPT7cMt++bVduY706ASB67WUsbRLZ8g
	==
X-Gm-Gg: ATEYQzx80fKmxHS+9hBLyHFML2wRC8qndrj4D4NlXVJvCWRBMW9h9Pw4ZCJLo7vgbS8
	OK9bwE7HPT7B+CBVMDQjhzwvqShRchoGSqSUemB3LN46v7gP2FUnDbWffIPA8Hg60b6Ts0JQY26
	VaKDQsq4/fOoW4fXahkQeKp2EamQiNfEaVe/bp7aS2/K170LtgUF+2zNz+xVVweLKaJY0vYgyHP
	NQBTzFUX/WHOnZtS7K/FIBuhHQqHIQ2wbttIVXhJBif4/9yaJzBmT9MD9b67vXAVh5Kl9B2WCfh
	ktsB09e+E1bWXgqw3BZfhRe4JdT4XxOzY5AvYb+cISQ3d3wy2oKc/xJp3bY6XzglvvmKQSkxvJk
	pOgzYZwytfR9Xij84Sk/ZabTP5tsCNkwczf9mEbYZkFg+YmC17Cf5np4GrdH/VPNhzTyFFNYQxl
	7J5Po=
X-Received: by 2002:a05:620a:1a17:b0:8c9:eae0:d1df with SMTP id af79cd13be357-8cd6d43bc63mr1485245785a.6.1773145709187;
        Tue, 10 Mar 2026 05:28:29 -0700 (PDT)
X-Received: by 2002:a05:620a:1a17:b0:8c9:eae0:d1df with SMTP id af79cd13be357-8cd6d43bc63mr1485242385a.6.1773145708729;
        Tue, 10 Mar 2026 05:28:28 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b942f18b009sm477024266b.59.2026.03.10.05.28.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2026 05:28:27 -0700 (PDT)
Message-ID: <d9a1f44f-6e0c-406c-9e88-471f197e0490@oss.qualcomm.com>
Date: Tue, 10 Mar 2026 13:28:25 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] arm64: dts: qcom: milos: Add LPASS LPI pinctrl node
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260306-milos-pinctrl-lpi-v1-0-086946dbb855@fairphone.com>
 <20260306-milos-pinctrl-lpi-v1-4-086946dbb855@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260306-milos-pinctrl-lpi-v1-4-086946dbb855@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=H7fWAuYi c=1 sm=1 tr=0 ts=69b00e6d cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=B07o7Mun2X3wBQy5X0wA:9 a=QEXdDO2ut3YA:10
 a=AYr37p2UDEkA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: F7-e-zkHx2Lz1LzEpCZCAc4Y4Z4ye5T8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDEwOCBTYWx0ZWRfX66vCrvqn/Lml
 /lz4h/obFov6Oek4pY/74lM/mBZ+DdXRC/4eIknpVp/F+akuNWgzWux86fmVDWAgAKFD4eqVl0X
 BLaLV/fDlRta0qU5xrXnM5dPlxwW0HpflhazEcRtqfKFvMvMqn/QHv9Du4S5r1JfznYx1N7aKm1
 NXBGAtfwkLAfz6xH6sxOj5J6eQ4VanMJoJwVHmtNnZEeuWaSgLwNsyCQUyqCI97c3USZBeIzsW8
 iMUdI4ISN4/qlNVapgZ4mSnvvF+2qr8XVF2HPO/p/Lok3scrdrT02eOCg2PG+TVxYLDux7vEDSK
 3kkvKxhUNRgsSAsqjnx8i6TJBOJhvgEPYDoBmi9oX+/LofuPA+qY9piZE0yfg9VF45lBPzFDpYT
 AqKgW2kxI4vYgwxHsGUPyNfqpYZ8QLToDWFwr0KBeyR9GbZVMaYrd3Z7mPOTielsJUBttUb0KA1
 fpC7tmz7wwgqv1JCFBQ==
X-Proofpoint-ORIG-GUID: F7-e-zkHx2Lz1LzEpCZCAc4Y4Z4ye5T8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100108

On 3/6/26 3:22 PM, Luca Weiss wrote:
> Add a node for the LPASS LPI pinctrl found on the Milos SoC and define a
> few pinctrl states that will be used in the future.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
