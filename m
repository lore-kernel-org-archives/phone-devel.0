Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D87B44C646
	for <phone-devel@vger.kernel.org>; Thu, 17 Sep 2026 09:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789638844; cv=none; b=B+/XV4AA7tZpwFfuIrobWZCUDHJHw6sAW05rhLClwyhdTkiWtPoqI3kV3momUR7l5aEfYJxQWkH6Wp/82Rd7TKi8I5cANsLf2K6f6959FssYoL5BsQkMqfyMAdnA46kBDcOFoeejqV7cy7Tdw2286C8YUfMijcgx7QzyD0CUxfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789638844; c=relaxed/simple;
	bh=Cve130myEL9inyJHbquCFXzlJXeFLlPCSP2ZaBXKxNY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SwvjuVLX9Q+vylAWMfsCQXvzUdl3ZZ2dU3Zn9aBFY31hagydMV+iOI8Ut47rdlWhO9UqbTip0fdSgZzrDY16pJwKMG4ESMC3EbN29mq8RWwKMPZTs2tHLZrHTSSRnglp5djRY7PA7G37TPzBovtluKSp1ZtTjDmwJbXabKImt/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ejIHOTYX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VCHGC3W+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ejIHOTYX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VCHGC3W+"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H9ZlEq613584
	for <phone-devel@vger.kernel.org>; Thu, 17 Sep 2026 09:53:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	D7idV/SmHuaFlrgRp6yA6OaUWlWvXCzc//paIK5S5A8=; b=ejIHOTYXd+7K/NKL
	fmqCwe0oAAkmWpSrf1jb+S9hKpG/SVZYu3Rc5ZJdbURb71uvDdLtk3ZYHf90bL9b
	EJoLe2RkjC1DcT3lKSWJUZ0W+WawpExtxQi9yZQMQPrzaonEkbkAJBp5byR6m7nb
	ePfzvRaGN0An3EEJl/4365aruYCgb0BftO5i23kjrw0oZfUyCpp4dI5JssvBd31E
	jG6daaGGnuPHV/TuiOzt2rvQNUed5dZLk/cmUJQ4N3fYk06yxh6MuSDxeTHd+h8T
	yc7A6bP+X9J3V0IQY5vj/5/9VpqPgz+dMaEZcKN8cblAx20YhqMf/dxY0jRvfcyl
	tGc6cA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grca0reyy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Thu, 17 Sep 2026 09:53:46 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-939fc317691so18796485a.3
        for <phone-devel@vger.kernel.org>; Thu, 17 Sep 2026 02:53:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789638826; x=1790243626; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D7idV/SmHuaFlrgRp6yA6OaUWlWvXCzc//paIK5S5A8=;
        b=VCHGC3W+SHpUaE0QU6E+1D9Apqkn3JFrCI/5Skh/B0vT0sY5Hgq/2UKzPD/MkqzI/G
         jeSoCtLZUzZQlXQkhQea5Xo8MXr/sFxbV6p+dlTGyEWVeK2DoItJNArpmdbAmPCiSr2D
         Dcx7CfinEAC6/seCzBlrGBc8uWOQDdMf+MR0qFDV+mUYM9KnumDDe9RSBSxIruhcBEHg
         RspsoIRx/1EVXCnpIGLR2tBcaigWynjvcNb4tI++lcMtu8qyDP3mpqmt/BeflYq65xr6
         UFlw6qtTe/Ja341K9QlNwQvoqO5LOtmcd/n/Xp8v9zHafM1LEZOxRNkYqsJNmkMfCPOg
         RmGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789638826; x=1790243626;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D7idV/SmHuaFlrgRp6yA6OaUWlWvXCzc//paIK5S5A8=;
        b=G1cXvF7r1m8PQx8YJ5G10kZbls08bcWlx6REupjwKAn5i5JCXg41jVW5vOeBGVauey
         XhBFm6FzrbOYnMrd2Sq775ZYgHIrbIHYrX6WP/hKyk4xMftNHxnrwUfGYUbgDFZzJCxk
         jd1AITtbAaGwLC3MPeiTkE6e3GmeqACnzAVy9iSIie7VCZnIPYG04AO9FOPYFscfRUnW
         xMilLlLdfuuz2zamL5mmuoXg2rYTH9U7AbHFT2pQgdNupP+pPG2t3ZKf05jdms/oEAba
         wjX+LsbFV9cNDCgbOnQnHxgK1gXsZwlB+hiqRqz3XEwmXgr0p6LgVxKlG39CLpO+72iD
         YbuQ==
X-Forwarded-Encrypted: i=1; AKwUvBwUnDBSyOcTRsXlIntQ61BbBzHAVtYQGmN1/6pPWPNEY0OP7QDUTYiHjfaCI2s+hYF+lQXHYRZS2fRSxA==@vger.kernel.org
X-Gm-Message-State: AFuF++nIm+SOMZqXibva56qUBLLKyQqQ7kVc8nvAwcjdSHwxAtCQunxc
	A0b/ct4NJhBAr5oXmxzJCS+41odUX4EV5xc3nn2Fak4wBPTIWxwZhI/I7nlMVY4QkjylSe+6KUI
	IISp5TnJMqnEhnRDrqPi2ZQhH+JSdo06meWT49oxci0IOVzlRYODGrS+a2d1Sh6Y5HA==
X-Gm-Gg: AYBFou3I0h/qziMafDS6UX/Bh/h4X1xIiJnGyn1YCFvVVx8/mIjZwfnjayJaDckRQ0Y
	t6iP6/W8rhRqf+n9m6AtDbGLrWPHD5rf2b9tUJCd7enqajfNP0yBU4WHblS7u+k52P6g3BpSeA+
	38avDqz8JJ0qzz+d2XU1nZWWb1CB25tH0u60st5ON3ql4Zrp1kj7Y9Omd3+HoVHlYhoRuE4vlbz
	UGOAX18DiHFRew2t7anHY8S2qzTqUqXVRv1LgY3lL/y7U/xqN6FuU8e+BLN9w+CuSMs7eATXjDe
	GYWg1McFmGpQodjLgRCzeD+qtpbtnjJ6YnDHoTIYdG/iFe+/A8wJJ7dSPKXGPrK6yclFsCLpIQy
	79pRRsy+moQzZTpkzEXlxAA==
X-Received: by 2002:a05:6214:508e:b0:912:3128:bbef with SMTP id 6a1803df08f44-9124ff4e920mr3296156d6.0.1789638826424;
        Thu, 17 Sep 2026 02:53:46 -0700 (PDT)
X-Received: by 2002:a05:6214:508e:b0:912:3128:bbef with SMTP id 6a1803df08f44-9124ff4e920mr3295926d6.0.1789638826034;
        Thu, 17 Sep 2026 02:53:46 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c29de602065sm254533866b.47.2026.09.17.02.53.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2026 02:53:45 -0700 (PDT)
Message-ID: <d8ae41d9-2312-4232-ab60-2f061ac5fdeb@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 11:53:42 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 1/2] arm64: dts: qcom: sdm845-google: Add dual front
 IMX355 cameras
To: david@ixit.cz, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Petr Hodina <petr.hodina@protonmail.com>,
        Richard Acayan <mailingradian@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
References: <20260917-pixel3-camera-v10-0-df631279b39d@ixit.cz>
 <20260917-pixel3-camera-v10-1-df631279b39d@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260917-pixel3-camera-v10-1-df631279b39d@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: XNf-xbt2M-tKvAF9jnaWqRRRpHHMKOEj
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDEzNSBTYWx0ZWRfX0YHliwYM3GWK
 Ve2Teas3jpTfVecaVE3ZvADf1dc3VgOZRwN6rqM606NciRRo106QbRabEkv8udQ9rO+Eezu1TM/
 sHvRFoFUv/LOfEQDzE8EhiT5t7IE10Y=
X-Proofpoint-GUID: XNf-xbt2M-tKvAF9jnaWqRRRpHHMKOEj
X-Authority-Analysis: v=2.4 cv=dOQzC+Zb c=1 sm=1 tr=0 ts=6aabb8ab cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=uxpBaPyPSpK-buiB_gcA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDEzNSBTYWx0ZWRfX9v88CjsWm5kL
 z4lIv8CSFeSmZl/RuXb7+JVmekafeSqnnGgMGo5DtIMz0tEyQMh5z+08yrGd6ldqty2u04+yFm5
 viR3mTkOwjRz2WzCv+9U0t2pIm2pWYfP9bs7kcNm+81BEv4GNGAVe2w5lTnfxeQLPnZLX1jP3Pk
 /D45C86lFerQ/a5NM4eEFZmAErhyaLS8F1Q7jleO8BJsANKS/Fci92IC5Uq2XwZB9dXvBIqAIoo
 Nga4gsw1CL2YgfoQ42O/G8HuqEyGidUwmNj3fuFxRWdtc4TvVep1bRIZyrY8aGkqkCtS5HPUed3
 TYbD0LiK9ChFnGraJ6DeM8kHh0+/bMsPCuaG9A4X2cUSyVRw9sMSMgU8luOFPGBGJdwk2CD7gj0
 lWAn65+uFLpGq8apNvAR8KjvnD5alNMFWIE7o2j7ankF75HiYD+gBRX8LgOGGbiSGseUcU2zpqG
 00x65C+8LqzX1hTzevw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 spamscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170135

On 9/17/26 11:46 AM, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> The Pixel 3 features two front-facing Sony IMX355 sensors with
> different focal lengths (standard and wide-angle).
> 
> Sensors are connected via CSIPHY port 1 and 2 and controlled over CCI
> I2C1, using MCLK2 as the clock source.
> 
> This enables support for the dual front camera configuration.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
