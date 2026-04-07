Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75B653976B8
	for <phone-devel@vger.kernel.org>; Tue,  7 Apr 2026 10:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775557686; cv=none; b=kal+NnOwkGgDPqP7LYElTJ5vIGiezTaMmhqXUh/ILUUOA694pLwGgINJXnTmBiKozk/X6e1IZodGhisSXMy7t5XpTaeEisX9ab3rYOwx0Gy7l0YNq7BGCAW8iw60HTf5DPWSxZPMHQnM6kkYfzFvnS5Jd6K/lrujsxd2XgKzbuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775557686; c=relaxed/simple;
	bh=42+BNKoCO0tKLWfV3tOfxG8ZldR7cHwM3gtUTR9cU3c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I/kNODKGTqLOkSjjvsLKaaASVLsNX50yXOQZrpFNz99c5iWAMdN+UI4cx07OypyJYGnGdMFQA6kTp5Fu5tx858uF13gdMPf3wJndf/FhsD8qTWd+tLS6kTfWwLgqKsv4jCF/1WBZNwU+L4PMDIxKWG8eEJdYXhFFGotYuWLoZ+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KADg3fNv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YBXZmVLM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KADg3fNv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YBXZmVLM"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6376Zks62549950
	for <phone-devel@vger.kernel.org>; Tue, 7 Apr 2026 10:28:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TdxD3dXHf9v7B1spgG0Hozv6M7VLoe1/5naDNyB9xr8=; b=KADg3fNvYPYMbE+r
	1ZeLX9q29d8XSNFBedzbzdBmONEcR5M4PmwblQVNs36BQ4uMEbB/JLKWbBQesEwb
	u6NvwsAKtxMr1eN468WpqZ/Vi81LNwO3iLwPf8snpz3dfR9BeyPQAdyJEWS3p+tT
	ZTz0t6qsqegeQeT66dUixfujqU1Dzvwsskkc8EuN8QgeGLWtK194pNnN+DoXc04n
	FgYCmPtyzG/mAGv3otxPB7qta5zusy8freIErrQN+TIJhigYgfyc8jXEZdswFZ3j
	MspNR+W2QgRTe+sf/+T3V7/JgoP2BDdAUUeb5sg3WkGj122gxKpkdGFFsK0h7mjG
	j81HBA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmrea9pm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Tue, 07 Apr 2026 10:28:04 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8a5bf7ee420so19684406d6.0
        for <phone-devel@vger.kernel.org>; Tue, 07 Apr 2026 03:28:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775557684; x=1776162484; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TdxD3dXHf9v7B1spgG0Hozv6M7VLoe1/5naDNyB9xr8=;
        b=YBXZmVLMxslBkOPjH/qTKLySLpamyERH0LeD3leWs5G/4LxoQtzdxNch7aDShwoG6s
         mOaffIezmTWOdayXmTqJpGN0xiVFzVTb1wEOBBqlCWO8EzL2JwEn3b5IGESEqKbokpyB
         vCExflbuhARdRqfTA1CBgjRvjWC4nEMgNhDpfFHeT7UW3mEJCrQjKobmkTgMW+mu3fnQ
         XGXDX8KQHdqueOK0lCcPeJ8czJ2ZhSBRCGnO6p31XG9Q9DJgZYU0KQZCFXmFUywOd4Wa
         2SpGZawZBoqIvCyJNqdvevMeOpPu5aOp4pY5ezp4j9coWeuu3eEz/Evoxa7/spUC9s5k
         1hUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775557684; x=1776162484;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TdxD3dXHf9v7B1spgG0Hozv6M7VLoe1/5naDNyB9xr8=;
        b=SuyCmC/yJoKKZD45nKVDCm59gk3YVr0DpjvZiqhKI7u7x59ufGmN676MJ1zuIMNQux
         U+/griIhn8rqOCU4tcN79eD2R44zH3JmYGgEw3wuNblVJ22jzv4OzlAzPEOeORJqX/0G
         Flhg1LYe+ns2JamiNUOR6AbOvZPy5rl6kdpGzdx8Y/Z+qBgAAVYJ5O0KAIhvtwYTLPV6
         zCpj5vYelgx2rRta2XN96CJOGpZf4zYzpQILjO5DaVS052t8geUZaR2JiiUWSGNZRISx
         Jode9XeotzJOJZqLw+9rB2naM2J79KGDxK6Ri2pGKITq7+sy4ttR+2xfRe9DFXF/DNPb
         ISkw==
X-Forwarded-Encrypted: i=1; AJvYcCVEAsB70KRGZCYhN7zpo3NDirTSX0NKRKhJCpUH3tZqKyDvWJklR6Izk2Nvov5f/66NKvqRuUzFd1YGDg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yziq0Syol2kLwQban9sRQnV1+8YpogWg+ANrNoxf50NGi3XLgAi
	sdReev9MtQ8FCa9dxWHSCWl4jRQn7b1xEecbEYnd+Utn31uYIOWVftVulRTFc+kszcAx/7Zwktr
	1zH5UdaL74Z0t+aV2fjUvMDcktGZRdQPo4sacoxoYd6+Q0Z7JXkXQL2LV1sax3vKt6g==
X-Gm-Gg: AeBDiesTSfDct7VWJQiBHEGubufG6gby5H6RvzOsV1ymR52dz8lMSaHdb3lh3psWU8E
	LJZiwh4oz4glOOPm8Fn9F7HRz6vKhoENTSJGEdgOYhg8e4qnQakkZps1zeSr7FrZmT1YD2peS3s
	ahUoP4WJ45mxG/nYk6t85g0q1ThMWibKahV6Vfd83LQ/5BRCpab+J3ZZjhuDr7c3wRd6HaPBH6t
	JFC6bkLKY8y32KzwnGLwommGEW8QauwWd7sbpAGi7gKmApKqtgnpu1JjF0VY/MEgj43PCacguF+
	qKZmdftVt2ivfSiIyHgtJtJEqcotKuBOBOeCi/jc2S0SFCkpZYERReuzyM4MBQN+dM8kC48kFcR
	VhHtHqBEo/mjLY3oJTsBUJ8oyBVt3F6ijRjUXwiMr6WOPDprLMHLZycjS8WVXksNiEzkPskVSDI
	c64/s=
X-Received: by 2002:a05:6214:29c5:b0:89a:595c:b805 with SMTP id 6a1803df08f44-8a7055842b9mr189699626d6.6.1775557684040;
        Tue, 07 Apr 2026 03:28:04 -0700 (PDT)
X-Received: by 2002:a05:6214:29c5:b0:89a:595c:b805 with SMTP id 6a1803df08f44-8a7055842b9mr189699476d6.6.1775557683589;
        Tue, 07 Apr 2026 03:28:03 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3c972293sm542256466b.11.2026.04.07.03.28.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2026 03:28:02 -0700 (PDT)
Message-ID: <97abbb44-6259-45c6-8b75-99a646d22427@oss.qualcomm.com>
Date: Tue, 7 Apr 2026 12:28:00 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] ARM: dts: qcom: msm8974pro-htc-m8: add touchscreen
To: alex@me.ssier.org, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Luca Weiss <luca@lucaweiss.eu>, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260406-m8-dts-additions-v2-0-c4c4bd50af48@me.ssier.org>
 <20260406-m8-dts-additions-v2-4-c4c4bd50af48@me.ssier.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260406-m8-dts-additions-v2-4-c4c4bd50af48@me.ssier.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=OKEXGyaB c=1 sm=1 tr=0 ts=69d4dc34 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=8poMKPHdAAAA:8 a=EUspDBNiAAAA:8 a=h-iMAVde12pwD0qB9LkA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=fyZPtLC9JlAwSkJ5-iUD:22
X-Proofpoint-GUID: B0ug7VwA2Xane_LiTMyROFQLAaqPYBjX
X-Proofpoint-ORIG-GUID: B0ug7VwA2Xane_LiTMyROFQLAaqPYBjX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDA5NyBTYWx0ZWRfX0tFtOAaiDJIT
 lTXa/RHVMTHJZxl7NOHp9hHEHXELN7FipADXIaechC9WOZ6eQlYB6QhH6fHtovaPVj/8s+uqEgW
 GnePpQl4UfxIHfrbwkQGP0hJAev6tXujPHATiuJC4H+/cr/a+h26yjhc2Ow4EPeiY0xeov4zm52
 kJb7AJnnwi55By+wn3sSWu7Fc0lh08vj804SIwZWaLK5zzD+pPFvMU2TJ8Sc72Nje0KFMM+YVAA
 +maRqB7s8PKMzi3VmVibefyZwyvX4ehDQkNMYaC5CG7CFEuw/6HHu6RwpHqbEBqG/3tCxsOKxHv
 KNAbJBTu7Wo1szU6GANsH9eM8UKokg+DpDfScSsDbbzt0ASZ6p22I91kD4B7WPy5uHt+G/nahRB
 zWDK0Uz+ceIu9GqmYT8hXZ/MMKiCK3FDSC7cUbPdwoDA1zml92aLzfK1NzR2PyHQIT2rljSIzmK
 3UArBWWspA8Pqu4smRQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-07_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 spamscore=0 impostorscore=0 lowpriorityscore=0
 clxscore=1015 adultscore=0 malwarescore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604070097

On 4/6/26 7:17 AM, Alexandre Messier via B4 Relay wrote:
> From: Alexandre Messier <alex@me.ssier.org>
> 
> Add the touchscreen device node for the HTC One (M8).
> 
> The downstream vendor kernel used an I2C frequency of 384 kHz
> for this bus. Use the same value as the vendor.
> 
> Signed-off-by: Alexandre Messier <alex@me.ssier.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
