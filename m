Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20577242D97
	for <phone-devel@vger.kernel.org>; Mon, 23 Jun 2025 12:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750682384; cv=none; b=FiyK6yzx5erss3J0sKSbYoe7RvGryJoGgraHWfFlC7bHLTZoyoNAoH0jfc3UDSeAu9CHQaSuQbNuwZJibF3JoUa65yu6PA4X0qLy/Z6G63PpGAiR3gq/PnsMaLRyAXuCXODe9H5zhQOy6UdrlY3LKTj6VJUldLifD1ukES+UUbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750682384; c=relaxed/simple;
	bh=Cu9jHf/ikY8NTIpPtIILN+lROMbPCSrdR9Xd8v8FLdE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qFzHFOMtJUtucGY35iV85cGCK30JbRDlaOr0XDAKa2atcNq6Q4lH/Zx/AmVPX1gh1/lX93JmCPL0gqp3X2H7N9XrHqUUcgA7MdJsRjZiLF1TcZnOhm7QOcf90frHWdNubKRd6LlXxayGiKVgu3ESxZn3ZCP2k3qK0iC+R3xqL+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z+t0h0WD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z+t0h0WD"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55N8LfWq005903
	for <phone-devel@vger.kernel.org>; Mon, 23 Jun 2025 12:39:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jogcupaRNgtSLcD/zdh/2effoHJ0lzN8HVzNy0f+7KU=; b=Z+t0h0WDpKpKqXL2
	g6+2p6EFptin2q3B64PTIZ6rJtpCa3WxnmKiHk7ouLlSBmEtzWaUjENYfE4owF8/
	DpqPmPjQiv+Epmo9CWNOkjAcZaAB6o7nZBOVvPA/ehLlmB7fxrjLSYN0DC79BBIg
	FJzfP/Mpx9zLFnbZ9NHli7X7DtM+s5NYZzyuE9qBqB+3oe65orBBVN35gKyaXAeT
	sFLD7tq3kyLMLNX1LTZDGt3K/UgCl2Rh0nzHGGCMTL76LQgRp/f7Y76Efs3cw3yb
	y/4KLgnHkVqiOPJz4jRU2TnABVP2UPahkzPisO8ZzNePgOUzKX9H5Nljt50vcjLp
	mXr0CA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f3bg8psm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Mon, 23 Jun 2025 12:39:39 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6f539358795so4300896d6.3
        for <phone-devel@vger.kernel.org>; Mon, 23 Jun 2025 05:39:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750682379; x=1751287179;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jogcupaRNgtSLcD/zdh/2effoHJ0lzN8HVzNy0f+7KU=;
        b=UigvIrjoSXPjxNK04LsZsYiT+k3qTVhQZzcx9aSK3lJ9jOeM3Ng18tRNl9GgRe8hN+
         LTG2ITan+aFXIjk8O82gEOPXSb8cvj7WfVSJT3PZk29ZAt4BihaSmi5nQAX0/248rFBZ
         ETJl/NtxGfYvybVphYRhl8y7An00Dx7oFZiFobU1tksMKi3zCsneb0h8Xi9DZMfvEslg
         xank+S2nZisGCs3T+KBXc7x8s9gXWHt8tZiLHeAGn7Do6Gan6kDDPpNizQwkQcjhVz/Q
         rg7Ua+0rm4ofzKb6LWtwGKxBA4jzvU7MLvY5vP/GWAABHuEJmS2HY68bm/eRFuy57abQ
         q0Dw==
X-Forwarded-Encrypted: i=1; AJvYcCUutXVFLlZu4CoiRKoSs3XJWlrkVu4yrUtAuh2pU3HOQrRhMGGkRH8l4ZGM4emCde1w6pv8gTMgDbte9Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxEKYpuZqlX6KZ2ZlXorbAenw25/VaTXngLqhd+v5ml2yy7kVnJ
	wUw84MLOukYI/mojDoaosjuUpVvIeJSUuPvDc9f5lzqQ1TV4WLEcZnPTHnwxlJZEoBwFcOhxg/R
	F8eLN8zv8PozA8TQD5gMJLGWIkxrEp2WT83/lrC2E/i2lAtNjBntcS5tQrabEhz9+zQ==
X-Gm-Gg: ASbGncsSK+RTCp92ueEagMvyGxe7nHVxLj3ZKmql9Hn88so2tjJVmIC48IyH0qJNgdY
	Vf08EKgbbUbze/ZVxHMmpZ3Ny0gfn9cUjEN9ri1e1voPfowhg9vT/8W6WlH7ra3h71VqcpGUySr
	8M/a+fZoLgpF83ZfVGTjM1LiQ8TykHjlRejpnLclglllxOU6lUe8PwDZxT9qsjMzTnujIZ9Xddq
	eL3XenVh2rwzNAT+0YZXZHJXTQECBdkpYKD31wnauPgFAnlHEq2L2x5nMgsxsfvaDlJBojmLprg
	JR32fB2y89UlDztI372zncTYI8M32/BAxI2YiDC5Q5Hefscn9nIGIaGHi9mrj8KUDCyZwZLStZ4
	mycc=
X-Received: by 2002:a05:622a:253:b0:47a:ecc3:296c with SMTP id d75a77b69052e-4a77a0b9c3emr72710151cf.0.1750682379050;
        Mon, 23 Jun 2025 05:39:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEEzLE5XIZwxXABQIRsBupydSEdmMwxw+uZsKhm0u2LXtGuTXdMotWQUEt+fgx8u5hMzuy3tA==
X-Received: by 2002:a05:622a:253:b0:47a:ecc3:296c with SMTP id d75a77b69052e-4a77a0b9c3emr72709901cf.0.1750682378617;
        Mon, 23 Jun 2025 05:39:38 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60a18cba668sm5900336a12.58.2025.06.23.05.39.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jun 2025 05:39:38 -0700 (PDT)
Message-ID: <50b0aa77-4ec5-412f-9ce5-6ec613dd0afb@oss.qualcomm.com>
Date: Mon, 23 Jun 2025 14:39:34 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] ARM: dts: qcom: msm8974: Start using rpmpd for power
 domains
To: Luca Weiss <luca@lucaweiss.eu>, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250621-msm8974-rpmpd-switch-v1-0-0a2cb303c446@lucaweiss.eu>
 <20250621-msm8974-rpmpd-switch-v1-4-0a2cb303c446@lucaweiss.eu>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250621-msm8974-rpmpd-switch-v1-4-0a2cb303c446@lucaweiss.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 3c3IQNkGGf9ilcNeofOWv4jlrUgRSp1W
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDA3NiBTYWx0ZWRfXyISOXfiQOnre
 PIZd5s/dPY029IxsPHf5+I69lfYJtddvcVG39JmG2KL5maoFivihjpwOVU1Om/+EZ42XtMKsuCE
 HKog9O4/nxbkmNqNMZDn7KnfG2xp4vi4+csCh+1RtWeR/Bo+bPh90MMVCuARO8SQBSIInQcUAac
 hsLzCrqmFgHIBmP68kos5L7+ddg5GU55e3JWhpFSOXrnHRxza1D/r3rgHPHY+AElnN3EjE6qPci
 c0n3oFBNaK+TZcZJQ653MZqIsSLXM6T6BLruKB2kf3uL5VT5SunXirFUtPBC8NHMCWJLqA3wMcc
 m643zX439Vf5A8MQH/LQI0+yIV/v5qWBMtI51vKW1TJawzPwVq4PTphXVkj7ctrjCn1Rfe/e9AA
 cutua/wmSgtRyukr7/1ya9ht2mJFiETovEZCkjVe1vJZXNySgKUdAJfLHD7nLbdAlSqqnw1u
X-Authority-Analysis: v=2.4 cv=L4kdQ/T8 c=1 sm=1 tr=0 ts=68594b0c cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=dlmhaOwlAAAA:8 a=EUspDBNiAAAA:8
 a=obA5ZJVW5cAYRlcEQtoA:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
 a=y4cfut4LVr_MrANMpYTh:22
X-Proofpoint-GUID: 3c3IQNkGGf9ilcNeofOWv4jlrUgRSp1W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-23_03,2025-06-23_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0 bulkscore=0 clxscore=1015 suspectscore=0
 adultscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 spamscore=0 phishscore=0 mlxlogscore=992 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506230076

On 6/21/25 3:19 PM, Luca Weiss wrote:
> Due to historical reasons all msm8974 boards have used the CX power rail
> as regulator instead of going through the power domain framework.
> 
> Since rpmpd has gained msm8974 support quite a bit ago, let's start
> using it and replace all usages of pm8841_s2 (CX), pm8841_s4 (GFX) and
> for the boards using pma8084 pma8084_s2 (CX), pma8084_s7 (GFX).
> 
> For reference, downstream is using GFX power rail as parent-supply for
> mmcc's OXILI_GDSC GDSC which then is used for GPU, but nothing there is
> modelled upstream.

if you use an opp table with described rpmpd levels and bind the GFX
domain to gpucc, it should propagate - check it out

> 
> Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
