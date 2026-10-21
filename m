Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792575212;
	b=MqDUK8B0aiFPTB1f4ZTMRktxKQ6TKJ+at3MMq5xKPMgAPkQF4RQwDqWX9ox/MrH3EC+W
	 bDki2DKuYmu93W3Tp5hcz0Q/lXf1YPFbaDqkzc9KAiF1/g1VgzSfwOrA8viseNgRQgYJi
	 32WlWyF/ymiKaZbBJjwBMkV1wFy9Mc+h3gZvLNnp6fKw631levr35eYghy1pa27rQKcCJ
	 OzmI7aa2/qt1aPK5L+fg+v7T/nJZVZyM2wJDi5PLhhvYJyZTV5VBQ4RmRkIaF1yI1cRv5
	 HQLWr0ia1LT/i/bPb8jflrUvWLVEPqkZEH1D93M3Qv7VD2YT4kGwIC/+9yiJlGMAkVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792575212;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=UOxlMxCeeV3aWc5tsW//V2qhk9/BquEemWrF1Xo4tEg=;
	b=1Mw9AsVs/cTOKdRWJGsvzSAZE8m/lcrWm7Ur9UAFk/PhNKZp1asT/3U/3HxvnQxRrsVx
	 jhQ0u8dVpg4PnmooPfSS0zw4rZ+fpLnyWgHVijsTSBZsbBVuQKqgBzEHR6eNTxYv/g0o4
	 blbszImn88p5eazDSn6HWK4TWl7J1qTwRiPGiKWcP/T/XiUUOYECTdSTdBRwHEg/TXTA/
	 uR3HYKZVJNFkWR/97UoZpAO5HVNA6ulNWwdPKK4fKz72kWy7xm/tKY/Bu1qCWkbD7FOgo
	 owCte0DTR7KlZagXq3xDE4zXd0mqYb0cp5T8yN7eYqKldAXGY0ySpj5EUWWZIWKWqxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AUfvKoYY;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hamLPNm6;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54251606A319
	for <phone-devel@vger.kernel.org>; Wed, 21 Oct 2026 09:33:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 54251606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AUfvKoYY;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hamLPNm6
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L8VRj22795044
	for <phone-devel@vger.kernel.org>; Wed, 21 Oct 2026 09:33:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UOxlMxCeeV3aWc5tsW//V2qhk9/BquEemWrF1Xo4tEg=; b=AUfvKoYYLuz/RiNj
	fU1JeE0ZX3dBvp0QOJ7aTeCslxnRypJW4z6rhGnRLYP2bfK8vtNbjBTJCuM6SACE
	MnRhIVpcac5AWC1PgE+1g2C6zPeQE+88VI/LYGT4CayKD5STdtkD4njtw9bLrmK2
	1Rv9En7HIksLlJmW8v2gwM5TOYlLpLAxserJsFppAktX5LlPcRjQ0VMFBzHe9IFR
	VyAMqD6wkbXQ+YGTm1PDgMyBbkkEDmgULpd5qEb+fKu8g9x7QOXtuV0W9+o97nNC
	qkmHMBdTjp5jwdekhrgcLBYGKkxCFq95Fvb6n67X7NGtyzMoTPMW+6w1xJF9LzWX
	/sgpyQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hesy78d1c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Wed, 21 Oct 2026 09:33:31 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f2bdebfc5so15636785a.1
        for <phone-devel@vger.kernel.org>; Wed, 21 Oct 2026 02:33:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792575210; x=1793180010; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UOxlMxCeeV3aWc5tsW//V2qhk9/BquEemWrF1Xo4tEg=;
        b=hamLPNm6h5U7OYSHnmXUcCqCWM3/B61WoKwDjGqpXpOx7+3PNTxh/DKJ7ariZUMwDU
         FqGKi/BF+5oGYa3S1XRPezVwFKUnsbjE+3KRUyBqHk0b0HIqV9L7R82YzhLqUIigogaH
         n6M/J+yMD3ff0qStBUSfvuf6NzhKnLYBlVL7CW6Pq0tX4ODyj/iDrXaMCAy3B71HXWSN
         07OcH5Eps3A59vEyy/RVIJu8TBKcCIg2XWU3DElLM/xpsb88Mh7Eyt8+/YtwV2n8pJoa
         bzYN2vVejuZWtumXxz3fiMkjMlXk2kMCdPZ0ryoupakCieTe99HAZWncPyCTzAbUqjvd
         b7TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792575210; x=1793180010;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UOxlMxCeeV3aWc5tsW//V2qhk9/BquEemWrF1Xo4tEg=;
        b=djRRa32dXe9s0DgrdvTPaHIk8ohNtra1+SHLUoLxXmlkWJulejfcdCuJMGl89Izour
         q4ydwI6QDbL3lFQTig+xE3I+uCpAhXFhmvYSDcXwpe+F5zxLAXw9/PtU3R8JaJuA899T
         wvhMWwJX+iTYkx5YOEyUfJOTn431gTiFxK+pH/IIRWHQJLvWel3jtT2OU5YiY/cEuXBq
         HRmi0enzGh3tsTAiUnrqOyquR4756n7BCKskyTjpLl8yI7hv3PwwkBz4+xSYDrqenmmq
         HdhG4ts4KxMYHvqh5WdZXh8k3gu6DIKRJAGJQV0++L6FZ6NxAbw9CrXRxJN2ZbMlyFiC
         Biaw==
X-Forwarded-Encrypted: i=1; AKwUvBysajCMft97gX657PooUtjQZGfMLNKwjTQRGRghOfwXBhs+e4AmkotKpTyWdV8mJ+P3bX9VoYskmVq8CQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYId82l6R0wAaJFbMJlbVND00+mugvo3prhctoOaxkZyWhWOVsJl
	upeU091/EtHosouNNxEj67vNpmE6e3JYKFq1X1rl1NwtMahr/Py2vcgFcT2z9pb2XtEUX7FbSXt
	WfTg8yi6vtcOS2KaKMXIgM/tccCtQzmT8dWdxD+ulM4U6Fz6DOcMKpqSpSDTYR7/oAA==
X-Gm-Gg: AYBFou3vTn8Tw3Q2J1fumdakNWe/fVRVL7q6nW634UQG/rU5BWaAz4rmwWl0uTuO9Ad
	doFJ4PFIojZJ6SVeQViX5DRr5i5fmFI3EzI4cCAPlZQFvdZdbBUXQyvuxbUA/vmkY/mCeESkn81
	3H/0IWrs9p8qVyV7kmtAJ61EkycDZYM/CH9cxxOqUVkfixfXlnMask85CA11iQwTJKNlsx1EQc0
	lpL/f85gW0zvrlYOndT3lqQP+/La6xswlD+UrenhQoCr4zDnWVE9DUWNbq+vDVZ1Z+No++b4MoH
	lEG5LXSlrJ18jdvmCfQychg+hIcUJF2LQ/4y4AR4hyKxjexe/+MmySpymz9KWI7Tsm9Xb2EdSDd
	7fsuBmkvwdVuEvjEbKsWBaw==
X-Received: by 2002:ac8:5f83:0:b0:536:27d7:abee with SMTP id d75a77b69052e-5369b4fd888mr26713201cf.2.1792575210495;
        Wed, 21 Oct 2026 02:33:30 -0700 (PDT)
X-Received: by 2002:ac8:5f83:0:b0:536:27d7:abee with SMTP id d75a77b69052e-5369b4fd888mr26712901cf.2.1792575210042;
        Wed, 21 Oct 2026 02:33:30 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4679037543sm59783766b.85.2026.10.21.02.33.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 02:33:29 -0700 (PDT)
Message-ID: <9981a633-4788-4b7c-975a-77c3a57c0352@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 11:33:25 +0200
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Post: <mailto:phone-devel@vger.kernel.org>
List-Help: <mailto:phone-devel+help@vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:phone-devel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sdm845-google: Configure qup_i2c2 pins
To: david@ixit.cz, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Joel Selvaraj <foss@joelselvaraj.com>, Vinod Koul <vkoul@kernel.org>,
        Amit Pundir <amit.pundir@linaro.org>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org,
        Marco Mattiolo <marco.mattiolo@hotmail.it>
References: <20261016-pixel3-i2c2-fix-v1-1-6a527d52c865@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261016-pixel3-i2c2-fix-v1-1-6a527d52c865@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: oedMKkTe1eE7qpv_wrQICuRzv83oU1tO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAzNyBTYWx0ZWRfX+3PnmCy/tmYr
 hNq0rWrSDihdGCIvu+ikz7Xp020G/shT5p63z1IJXVOIRLkrG7lru3i1zsgUhrcNB3MMt1mIGbK
 bnSy6UTbqQ7nnActCMHjZbC0YumyXd1pnEVQypMyZf+ENrShy2jhfk76nZT8K38LTGgmwr2dzOb
 +UP+S63rWmfMWw1RyWVMlvHbuVHfEOVLfl31v1nuY69c6d14MaIj4whXdrPHC9I3UFA8/2R6rbC
 k8gjKmkC/Cl3kHVwA7rhwTT9Mk789d7+eur2cU56Z/azhW3fUrhdYRTCxlAuoI0IkLmvMGFKpha
 7/8ROuEqmA0pNnjkn1Fa01BDJ3S+XoF1ihYRUbqmjLJ93a/O1Olt7qVsYLgS9Kvj5RFCqgtdKZp
 +z1pjry0rKrt4EVTcfBLInu7CyHa8Iibtes7yrK8RzcXSMrSnCgP3bZAFaqQLtuazE/k+ecXnPL
 0W5ChnywI0j/ysUer1g==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAzNyBTYWx0ZWRfX6O0ptAD9gCjg
 ZOblU6y5+MB/FJ1yMpYrlEcgx9PioNbVo6w8Pms8OWZBGCl1+2uYz+zlKokUO6zxO7IZYd7nGBV
 eVUbPTMzzkF+DEOB4KuMCB39UmuId9w=
X-Proofpoint-ORIG-GUID: oedMKkTe1eE7qpv_wrQICuRzv83oU1tO
X-Authority-Analysis: v=2.4 cv=IPaXmQvG c=1 sm=1 tr=0 ts=6ad886eb cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=vbdGY0My6zaIDZyNjYwA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210037

On 10/16/26 9:37 PM, David Heidelberg via B4 Relay wrote:
> From: Marco Mattiolo <marco.mattiolo@hotmail.it>
> 
> Set drive strength and disable the pull on the touchscreen i2c pins by
> amending the qup_i2c2_default state from sdm845.dtsi, as the other QUP
> users on this board do, and drop the unused touchscreen_i2c_pins state
> that duplicated the pins with the gpio function.
> 
> Fixes: a678adbf2d22 ("arm64: dts: qcom: Add support for Pixel 3 and Pixel 3 XL")
> Suggested-by: David Heidelberg <david@ixit.cz>
> Signed-off-by: Marco Mattiolo <marco.mattiolo@hotmail.it>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
