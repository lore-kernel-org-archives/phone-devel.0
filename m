Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EC1C27E077
	for <phone-devel@vger.kernel.org>; Wed,  1 Oct 2025 09:11:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759309874; cv=none; b=dwaLPcoaBpnGmZ5jMmw5dKLyfLr+0lLLRxc34IxercMKtdCPpOyUhbROxCk7nCwg+mj0S5Y1rbSoNBbB0DHE7PsYtdC7X309UJxKGLA8DWvaw/GGPCuH3ZGLOGSDUwPcqPjWXdaWVFxyXOYfVYLSXdKEUmvSSVUGGvdX8gSEiHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759309874; c=relaxed/simple;
	bh=e/WEVryWETqOkgzO3C+jeJYAOW+tg3knY1j/j0lK9Ls=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uvUFWg6ju5apAL4blCJyWOPItZK6fxy80QRvCVCjHkAmRypEpUyIxRaMwEoMWcrFWKxcQvp53D6h7+J0xoQbo7EpdVVAPlaFS8Se8ayE9I/yqroJI4LWnXnisgFcTCBELkF41g1e0bGICxtfcK5ng8bCIga1mZ/VEOW/HqvuU68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CAegxa6q; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CAegxa6q"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58UMDIH9001106
	for <phone-devel@vger.kernel.org>; Wed, 1 Oct 2025 09:11:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	e/WEVryWETqOkgzO3C+jeJYAOW+tg3knY1j/j0lK9Ls=; b=CAegxa6qKqqGDQ0r
	Ilfb7tNf9QzTIO8VmKfcoZglS9o8aJ9EzKim6VP+rjNZP2iYuIOjSFGEOV7lHQAR
	W4r42MC0nNcWyRCDXR8XkKCf96Y1OdFSnBIKBucPipY2pQmOERBr0luDeFdjAN4q
	2/h5qjmYy+Qrhj+sUlngYtPjsOKLt4SanvwhE2LIJr5KDta/OhY+lE4PPt6qaYUM
	IkZhzdYCV5PhaYVpr5fGgtoqgEWWZqzCRBc4kqI3lPD24Tj4RCnZtDnvIs5mVtpL
	lyK9uI30jGDj4rx6QzxUGKblhSXh/1AoF+ajYgTKW8W/gtFaGDpIVG5LJJaHZo3t
	7ZCLBA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49fppr7etd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Wed, 01 Oct 2025 09:11:12 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-860fe46b4easo188230385a.0
        for <phone-devel@vger.kernel.org>; Wed, 01 Oct 2025 02:11:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759309871; x=1759914671;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=e/WEVryWETqOkgzO3C+jeJYAOW+tg3knY1j/j0lK9Ls=;
        b=s9SD06Qb6XOYpxHuubBPRiYGm/rv4SwrfvD5VqiKLvTLE+gNU6VLZM9htiyvzSNKrJ
         HdQhhKzX+Dn1ajeo72zTXssqKJqY8RQaEdDoJ0r/k4XNv9f6nDk4U1/RsHAOYdclMddp
         PcImbZs810sSBZ/E6Fr7hG7+eE0kLR6Yzy/eC4n/n0xoZvnTCopuNfDDndF2AeLIxzBd
         /VXNWVCygbab+pDz8eC82p4WYJHzcspLvIXCfLPWvCguxcqPBKVIDi0yzgt80tuvl4Ue
         NJMLzVaJ0y2xgc0pH7NU3b8LngnDRrVBWr7qkJdIkUnq6R+qD9AaOKQaAh+TPUT9Z7H1
         6AUw==
X-Forwarded-Encrypted: i=1; AJvYcCUJxPwvyptTK1+ccxhAJgg3tAsV8tMmk6UbKimTU0BZngVsqgYCjwKr0ygmbKOP8Pls4qBUihmGuROC/Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxnrKNjiXD20rrQeShT4fcPENxe5QSskOFIuAtHqXViQ38VMsW0
	RMiq71MH/54tqf/SQwk/YWMrjZW1OO1oFdTLYZbBXrtHZyVw+oMIt7wTbkDEa6prkHXt+n4ljln
	eYz5e5IURAXps1avgxPx14gTgoY/5eniNLrelJfCyubdih9KUVrY9FZL4q7RQdth9sg==
X-Gm-Gg: ASbGnctYZhT08BX0quaZEnjtrrlSlFoWgbOzyvSeJJzeaon0GtvV+hrtPS/V9x7cikS
	c2UTRJlWJSHrxuLxCd+7ArHTo3gzMBvlbhXvx+3Mx+Q4aDXCuCvHbTs2yqgUh3rBErZz9rTX5Pv
	KM56K1ir7VBkU/zAzNSubxy2Sq/zHPoiu0G+y6q6ECLDJ+z83p0tjHkd3pY0lVVKU+qq85N//iY
	2i20kPSqcFIJzK9kHhwpqQcVe5j1QmwHJr34c6EVUMvaRapZvSklaA5aNrZkzugj6TFfx9Yba6u
	NOmI8lf8AXnhRZj+rGRkyGPs619KCjN7dz5BRk7PtTACOdVKVDLG3anrsv+2ht2cfibBOGmnEAs
	OYRfl+loBr18tdBCCtXf9TKFX1cQ=
X-Received: by 2002:a05:620a:4556:b0:864:a09a:e860 with SMTP id af79cd13be357-87375480bdamr242431685a.10.1759309871069;
        Wed, 01 Oct 2025 02:11:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGUmzUAc+cjv9+y3E3KgF6l5ePibQGjbOfi9JLtWe811uw6jRYJrLcGhg95ESiVfppfFFkd2A==
X-Received: by 2002:a05:620a:4556:b0:864:a09a:e860 with SMTP id af79cd13be357-87375480bdamr242428985a.10.1759309870577;
        Wed, 01 Oct 2025 02:11:10 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b3544fcde4asm1337283166b.76.2025.10.01.02.11.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Oct 2025 02:11:09 -0700 (PDT)
Message-ID: <68a07e54-9f0e-4938-803b-64d6f0c31e5e@oss.qualcomm.com>
Date: Wed, 1 Oct 2025 11:11:08 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 11/11] arm64: dts: qcom: sdm845-lg-common: Change ipa
 gsi-loader to 'self'
To: Paul Sajna <sajattack@postmarketos.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        Amir Dahan <system64fumo@protonmail.com>,
        Christopher Brown <crispybrown@gmail.com>
References: <20250928-judyln-dts-v3-0-b14cf9e9a928@postmarketos.org>
 <20250928-judyln-dts-v3-11-b14cf9e9a928@postmarketos.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250928-judyln-dts-v3-11-b14cf9e9a928@postmarketos.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI5MDA4MiBTYWx0ZWRfXzAGF0p0kWHtX
 UAmNIUjbMQtCeXunIipV5PFqoiEXSkmlIRu4eFzALFvKVyiosSfAmyO7U2v+AoFte507aGiCf6X
 8RxszXkaNCwPCHoXXqmyTJIbQtSOWdgdIzKQSdGJh6XFogMWjw2QngtCI2Fw7ucbSRDiMMRuBZs
 mscHGf/67kzg+9h2eqfl4kVwMahWpYaSsOCVJVeIsOeLXw54S+ijBOonJAQwzLF94OextU7RTmo
 d+j0aT/EXX/l2+8AUkFiOduPsy04EijTwxsEITbit+VoxbDZJy2XlRUNAZ0zYCXaMDv4Q0TJ1Vi
 vnrHWF9NW6ZG5B3FccSQ9F+hwL4OddSuAi8cdg9O7JeBHGME0C7+M3G/XnmRhvezSLJRoGcFE7Y
 d2tsfxiaHzQFov8Ms9y/Aso+1xqlaA==
X-Proofpoint-ORIG-GUID: IspQEOaAYrg6CUiXia5Fm598MNSHEM15
X-Authority-Analysis: v=2.4 cv=GLoF0+NK c=1 sm=1 tr=0 ts=68dcf030 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=j6DUTAs5CoFpl0bgMQ4A:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: IspQEOaAYrg6CUiXia5Fm598MNSHEM15
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-01_02,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 suspectscore=0
 impostorscore=0 spamscore=0 bulkscore=0 clxscore=1015 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509290082

On 9/29/25 7:05 AM, Paul Sajna wrote:
> This lets modem get a bit closer to working

What prevents it from working? Does it crash? Has rmtfs started?
Does `rmtfs -vP` print any warnings?

Konrad
