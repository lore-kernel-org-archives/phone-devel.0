Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 813322D3A7C
	for <phone-devel@vger.kernel.org>; Mon, 11 Aug 2025 11:26:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754911610; cv=none; b=PHs/nIdF15VmNMKZUT8UQyoooahZcUg3o2iSoBDVmxX4e0zrAdKLKFD4VeKU9EuN5UJoj/SyVuGEs15AdYHsbcwcbgCyo0dZDzw2ViP/uLTZcfT7FHoVgwVpwJ36067GJaZm5XIS5lkLNaKZbEcJkPSlPxiklWrPQPQauzFCNJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754911610; c=relaxed/simple;
	bh=SjIiRwkUuW69/oZGblmkKyoI/24xQdAns+MvUBljizU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q0XZvPEnLTrKMcHcIk4LygGsqNGNhyjcr1WI3BYlyIwZ4MTLd9LgBsR3HZ3hlMGr27ndI0NGKN06eQNyrhsVRYnznii1FWtOiNGC6y9W0WgyVMcZVxVRhaXPiPQvTiAx+/M7YMRJj31DBtU0Y9SKslWSECNebG3uzLMixKGMscQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YcuDWubB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YcuDWubB"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57B9dGJi029264
	for <phone-devel@vger.kernel.org>; Mon, 11 Aug 2025 11:26:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	X3MpL2rgvGRtzT3qycNG0CQC8CXqgfD3OIxhOY8bvSY=; b=YcuDWubBPQXZRXRs
	2mlcuWkYLTqabLlUE9PSRqp31qGmPvZjqCba5DZjJ0Dy+j3xi6PDMGn3DHRcKI+m
	RenByX2TmikuXUpqKqf+YBujkFj65lWZJQLH1KJZnKyev6DIsZg/9tUvAr1GngZt
	AFs9fCF9Mwh9dBssMCB9pqFhx0U25ec8+rcsCzNiXJ+pi1kdYjhI0DzGENXRZl8g
	2n292MVtixdPWU5eBm6aAXVSuLSX1zaR6Hl1abf5lyTPzNe8XKMferF5evURVCHd
	aEXb+fdYM6oidzxtoj8WWAF5VRxgAjJTPskHzYZVwavR/uswnoeGzxAHttp3kt/F
	uKClFA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dygmc4mq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Mon, 11 Aug 2025 11:26:47 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7e7f8e1dfd3so68858885a.2
        for <phone-devel@vger.kernel.org>; Mon, 11 Aug 2025 04:26:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754911606; x=1755516406;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=X3MpL2rgvGRtzT3qycNG0CQC8CXqgfD3OIxhOY8bvSY=;
        b=vSaFhFqrWocvPyRoHxurqxAKvz3UscIKJd64x2Dnv48Yj6q9ccVVO2oSR9WlI3Ok/m
         62Z+qIPnEw+o7wbfEEGa9lxNC72R2tajl8ni6kOYIXdScTRs9JDAnJcYuBXjOkXgqXOn
         j6HarCsqgS1xZ0AVmSwXZHi1BUyKi17vDqnvzqxYsw2OskAV7AM6Jaujx/ylw929N2zW
         5KcEBSq/ATqUjmom7gK/v7eowohtZL++7DUhQFDhoAWU8M4XyN/CRE7lW23uUDuPBlV2
         h/HCksOm2HyTLWSl44fXKk2PhNCseLssHgMDjuvouVhMB6oTRoFupM5gE9ELRfbnM/Hp
         MuyA==
X-Forwarded-Encrypted: i=1; AJvYcCXSiS22REpkNQdHs2hT6FrotwrojWDbRpzErwA8u8b+5k3VHwVLqJFgLghbHAfOv7l8TWTnbcseCzBsSw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwXh9PlovsRK6DJwCHtZrqss4vysH4VHMuySgYcJbNU97uaVPHu
	QMmsf/ixvYC/aApNWKvnWH3Kxmbft8qrYwQt85z17z2GpLoww+rBgD4dDsKV8bscJlA5N9egups
	qsMXji6mBc5iNqhKXbtJMEqGtVmXRdK5ExVA0jMCXEZFT34oHvpPv60X/ged9W3EE2A==
X-Gm-Gg: ASbGncukcs6W1OkrhPjBYrdfl4Tw9qoPRjsr+dn91nyLU35f6wXf5Le69X0zMmZVCC+
	YcADdgiHW1EqaUDnZCbzOEnUAQ80nlDJE6XPsMVdxF13VK4vWDt9ZD79YPlVF6K1ythTyTrcz2b
	o8P2sW/uA92Ju6JEzK0s7j0fTB6V55Lns7NfqOYmY9cIu5KZprPGN9M84656w9jjuTwVj0EaBye
	6kn2es7y8rXAwUHMdhCGIZGalVWoHjNjeISoR63div61U/9Q5DcBe2kIRfHTFweja+iRX6GNwuN
	hmJ253W8kXYrVorJ6gyBXxDww/+Qk2kPDOPi6CTDnJE94cIHZjjmxYA/COVsRFlkZPwU8F1OVlw
	gd7m8KuJLDZqAPBNpmA==
X-Received: by 2002:a05:620a:2596:b0:7e6:6ed8:be6e with SMTP id af79cd13be357-7e83b69fc23mr475558085a.2.1754911605940;
        Mon, 11 Aug 2025 04:26:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGyjAl0KldBBqrP2dkmKQEiG85HhgslHvNvUuKaCDwmYjM+dyvf+iuE8pKHOehKA/6xP5UTMg==
X-Received: by 2002:a05:620a:2596:b0:7e6:6ed8:be6e with SMTP id af79cd13be357-7e83b69fc23mr475554885a.2.1754911605480;
        Mon, 11 Aug 2025 04:26:45 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a21c076sm1978002966b.102.2025.08.11.04.26.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Aug 2025 04:26:44 -0700 (PDT)
Message-ID: <23b8ef03-58ef-4cc1-a467-0fa0cccddf31@oss.qualcomm.com>
Date: Mon, 11 Aug 2025 13:26:43 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/7] arm64: dts: qcom: msm8953: Re-sort tlmm pinctrl
 states
To: Luca Weiss <luca@lucaweiss.eu>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250810-msm8953-cci-v1-0-e83f104cabfc@lucaweiss.eu>
 <20250810-msm8953-cci-v1-4-e83f104cabfc@lucaweiss.eu>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250810-msm8953-cci-v1-4-e83f104cabfc@lucaweiss.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAzNSBTYWx0ZWRfX/WSBjuDaU58c
 PFnj03gMoIeo9CnW/xswJh6vsOcoG3zoejoMvqkCztqCgjsxGo0Va35MsE/pNZUbrK37H2tRJ3M
 9jluja+wxZLlwVazrYt0WyRao8UFhxGdPYRwtFAY2uW8u791j6Wj8/CWXhgqvfNYyI9CN+xQ3g7
 PKErCYl25vMOB3T9bYMKboBWhajkzUN4FWBa5WRrOxFX0IDSoWRvAWUJ0wn5ZM4tGAKdjiP+lHX
 yxwNcVNxvKPbqiJpzrOk3aZD9qbBrGkexkuP+LWli8OSRYkKNL3p0PaDQnUZ9EY5A6FyZ0oyyX2
 QPRUMj1JlsQIGLQ9A4oPjozW3sRawA2YDRfAFPYL9c3iKJmpKMppXwn8z4BSDs/aR3PjtnoJUqY
 n6KvUB/1
X-Authority-Analysis: v=2.4 cv=FvMF/3rq c=1 sm=1 tr=0 ts=6899d377 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=dlmhaOwlAAAA:8 a=EUspDBNiAAAA:8
 a=o2iUG9rTFtLDcKp-zFwA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=y4cfut4LVr_MrANMpYTh:22
X-Proofpoint-GUID: y-pbS4-zdK8yTg9iRKLYpwZjIz-0CZkL
X-Proofpoint-ORIG-GUID: y-pbS4-zdK8yTg9iRKLYpwZjIz-0CZkL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-11_02,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 suspectscore=0 phishscore=0
 clxscore=1015 impostorscore=0 spamscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090035

On 8/10/25 5:37 PM, Luca Weiss wrote:
> Follow the Devicetree Sources Coding Style and sort the pinctrl nodes by
> the pins property. This makes it simpler to add new pinctrl states in
> the future.
> 
> Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
