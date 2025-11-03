Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 372083093C6
	for <phone-devel@vger.kernel.org>; Mon,  3 Nov 2025 12:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762172068; cv=none; b=D+eyqP6zPD8bCMBbfPf1yGRN5Hf69wqFf3GvuxWyVzdryS/lgX7dk2LdkUeEebbRV1J5A7ud4q8sxwbbRKOqCWfkucSB137UdEC3obJwQfz6b5zD/j0ekV+XdLSK1sr68wx3QKg7RLL0hmyflUNkZ5cfrScuvemF7DINUhfmM68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762172068; c=relaxed/simple;
	bh=JTYZcKugNZOA0vYR2o3dVvUjZjHQpyWvNa4nAUsB1/w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OHgJ0VaPaPMTv5DueOH6Pnx4+9DJEkih40uKi0xy9GHZFJJjAEz35sNn67DYaom4M/FTS82Lwhfay9a/tmkECu9cP+AfHqqECBU6W/GdUKE+Z2jPWlpVE8amZ/aXwK8dQG+XBasaBO00K66TPHOQ1jwRL/i9DF7bZMkAfIhglB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OUzK5wEF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UNAx7P27; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OUzK5wEF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UNAx7P27"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A38p4X62732474
	for <phone-devel@vger.kernel.org>; Mon, 3 Nov 2025 12:14:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6PPtwZvy+gqvwwYYjdp01cD8qHwlSUjev3sm8V5A7n8=; b=OUzK5wEFC9V0CHDj
	GQ43SzIWe1qeGLVQY1cULEJLKVNG0kDOlmmNJ18aN7Jh1VKQFeWE0iBawNDgzRUx
	5OH8EQEKRP+LE3BFKvwnlUHHXB2ySN/OQblyq4oUHHCOrU7PNDJunlAWBN+YGOoY
	jJM/nEhg3WZEhd0dQkaEYj+rZVD9oy1tWqIsnTJI/x3K3UYTo47za0JAPamLkPeW
	+vcz12BHIqe+vyrzAxRPtvBk6XJaxKJM9ESxX/G/QMfT3EPrJ7YPCAvEwGYSg590
	KnC8hHSzVjq4OhpvUHLsC9tB8X9pXAIffG+/kXv7oWZPQXyseiwP6bWfYRWerTg/
	kdkz2w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a6s86gjsd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Mon, 03 Nov 2025 12:14:25 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-89ea549dca5so218125185a.3
        for <phone-devel@vger.kernel.org>; Mon, 03 Nov 2025 04:14:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762172064; x=1762776864; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6PPtwZvy+gqvwwYYjdp01cD8qHwlSUjev3sm8V5A7n8=;
        b=UNAx7P27BAiYPYoUMw1t1o//wNODLItHFD3I3YJ1N+I16WRTusSztY8NG6+WgTT01a
         5VXDffrNTz9IDmZiUipzBRBTMapqZXnCkGXq1aQW7KrqyfkhKQIoCwPf5Zkx5m2Qs8BH
         G5sN4+W9ok9UyDoPX4wktKIMJMjHpH3FPe0UdvDNqNTY12fCKzzbuFEzlY0hdwc5DgwX
         aOl9VYPaFkXvTGmWMvSM8T+ZSHIL9kfInFwiDWashP+KljOBAp7qBZ2K2LQMNNSSI708
         bhpDJS+8JqitBgf2EvlKbL5L2dvX7Zcfoh3+BCI5RmWI1EPfpGfb46kmdxJYuOncqOxe
         FnTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762172064; x=1762776864;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6PPtwZvy+gqvwwYYjdp01cD8qHwlSUjev3sm8V5A7n8=;
        b=erqZiQ9sTx0CvKXvnr0VMgpC0abp/IpUH5lr3WWqwPSpVibQVl54eHD2IXP0B/7757
         Qj0jXsWdwQyf3qdIalOmixpVSuIS19uhbpR8mBlCyExdwzxUTpcrbuWMaZbF6hFxAf6y
         ylDzffmZY8gWgPW0QTk41AQTNGDSJeaBAj0OfJmCXC7r2WaR3jDDRYkN7iyk5aXDAez9
         yelYbCFRi5r/sZ4Uy8o2ueepXd2gUgtLt5vtnaCd0/7/VZqk7+9zv4HBxbHVXVRSdsrd
         NBfsI52SQHiwVDCp36w/Znyr5Rff5nITIUrL6zVbymNYGlctSr8hHmQRrqNnF8Ofvczs
         ehqw==
X-Forwarded-Encrypted: i=1; AJvYcCV2QiRtH0Z6iUbb5mpok4hnMowszK1a8G5v64/r4SRkeB6zivW/3Q4D5XivxMUPRSBvq/KMwiiO7hHKeQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzfxSyC4KzBbwXZNgGr4hAGXY5EMwqKy32+8MUMJvOqoIn8kO4V
	pzwtZ/H5WuZY/YArm/ExYc77QJIE61Ybog3kP2+uxxS0wiQMflXjTOSisE2B5S7ur25wbYuKxfr
	7lhz1wh2j7SlAewP6n8zauKoYqjKFk83QLQRIwIwkYkFCMf1gO4kI6m2fUkPyVUhp5Q==
X-Gm-Gg: ASbGncum1Z/tD9ZCIBjBF2GTlrIC+cVt3fSdi0Gx/AQKKfM2BxKXPHUsgSw1ctvkmyg
	Xgc7e4uKjAh2FcywM04Zc7cY5MED0CO8xyy+UVM+ruUtcK+r/1YKweTxaCIrnyR01ZLoL7v1Le8
	FlAmtlPCjUfOeJF4MeuzrzamKwwZ4H5B+UUkk71YMJ9UAkifP3o9ShxL6kypsWmXpFyUXq/FSDY
	98zGWAkIHV+hz2HrwMzF03qbVbU7kmFPHGf55gKXWT4bBK3Ph56snVJopXwb3fr8VtvMZsIfvnj
	FyFrt+OdMr8n5hQPGH2km2O2KY9j9PZe/JVxUwH70g7wfXvjbnt/WYMbIhTPiaxTMwECFAOb+UT
	p9Cftm1A7PNq/v0AA7ujVPr7mWsnyzdO1Od8LUBU1jjTYmWKAJRLJW+Lo
X-Received: by 2002:a05:622a:14c:b0:4ec:f7e4:8a0e with SMTP id d75a77b69052e-4ed30f84d8bmr115447851cf.9.1762172064452;
        Mon, 03 Nov 2025 04:14:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFojfDNx4zUtTBFnI84zhhJWl5ScbUrZr2SjZmrkUFo9wwBQljbRwY0JohB1/KDEp4gMP6DxQ==
X-Received: by 2002:a05:622a:14c:b0:4ec:f7e4:8a0e with SMTP id d75a77b69052e-4ed30f84d8bmr115447551cf.9.1762172063877;
        Mon, 03 Nov 2025 04:14:23 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5941f5bc248sm2843451e87.91.2025.11.03.04.14.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Nov 2025 04:14:23 -0800 (PST)
Message-ID: <c93afd94-9d94-42fb-a312-df6e26bb2bc8@oss.qualcomm.com>
Date: Mon, 3 Nov 2025 13:14:18 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/7] Various dt-bindings for Milos and The Fairphone
 (Gen. 6) addition
To: Luca Weiss <luca.weiss@fairphone.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Vinod Koul <vkoul@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org
References: <20250905-sm7635-fp6-initial-v3-0-0117c2eff1b7@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250905-sm7635-fp6-initial-v3-0-0117c2eff1b7@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTAzMDExMSBTYWx0ZWRfX39u/IARGB1I8
 TT+EYu3HyAdnavPz8r0JitNVshnN3dOgeDS3JVKhm54xKaQoqRW3mgrcCB15G1G/eDDvhxUji+s
 SpSFioLp/qnoWvPR+BmN06wjOubxHvsTXISLGriQGm1gGOz/Ik3pmpITcOfV1XXrJjeDvhLaWjp
 ttoUKHYELJOSdyD1gXsebGN7KRSDLlshOjJGoXqsKiJRjhxYeIpQD5szGr+lb731GS9Zjr/ym/R
 vqir3/48qvFWRJeqkGLmTXKsfk1qjP9tjGBFoo2N95wgLd+6jB6dEKtvScU8zlmbQE6YXWnETJN
 haaK6bAIvXmDoDptWNL/FJiJM5qa2nSFD5Ygw0lasxdatV4TnN2RGC09+HOuK3A29EAW9rWMUmO
 0GU5Pb6r/Gm31Tu7MnisFLAAeI7xWg==
X-Authority-Analysis: v=2.4 cv=Tq/rRTXh c=1 sm=1 tr=0 ts=69089ca1 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=6H0WHjuAAAAA:8 a=PtzdWR5wS_Xl21Jse7IA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: JyOj2mjIertcyqUj63q_B4NccbfjZ8xK
X-Proofpoint-ORIG-GUID: JyOj2mjIertcyqUj63q_B4NccbfjZ8xK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-03_01,2025-11-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 spamscore=0
 adultscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511030111

On 9/5/25 12:40 PM, Luca Weiss wrote:
> Document various bits of the Milos SoC in the dt-bindings, which don't
> really need any other changes.
> 
> Then we can add the dtsi for the Milos SoC and finally add a dts for
> the newly announced The Fairphone (Gen. 6) smartphone.
> 
> Dependencies:
> * The dt-bindings should not have any dependencies on any other patches.
> * The qcom dts bits depend on most other Milos patchsets I have sent in
>   conjuction with this one. The exact ones are specified in the b4 deps.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

FWIW this looks good.. where are we with regards to the dependencies?

Are we waiting for anything else than the PMIV0104 (as part of glymur/
kaanapali)?

Konrad
