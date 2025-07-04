Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABB432C3265
	for <phone-devel@vger.kernel.org>; Fri,  4 Jul 2025 11:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751630098; cv=none; b=ohyFCdYCmYdXuyD2Sy5YADkLs5ya8NJeNUtC9rCGMu+yegPs+oO7s8UR0k9shmopovfoR/YUdk77k8q0H3K4wKmaWhJeGPdDd1TB1rWuZzRtOOHtZwpEpvC540DQ4fmfu2DE4Ga1NXN+8mb8ESTqWZNt4WgUxTemw2qCe3x1kYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751630098; c=relaxed/simple;
	bh=kBoOViu98NWdps6fE95Kh19ydZRURYbRTNtdY6TKgTk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CBwYQpnoEq7i8/N3FldygQX4ezyAZN6HH8IQjhpmYg4210EgpVcpyqPneWKDORSJzYXDEw1aI34b/F9+SO7OXq6idQcXuvOR76XM/q1whJBnftQToGqJxNQsqzaCy4TMApyvby1cKmdRXo94yYwDS+Wcdy+sl2R6eB2ZvQClaw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o7NN3DMR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o7NN3DMR"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 564BY9Ga012466
	for <phone-devel@vger.kernel.org>; Fri, 4 Jul 2025 11:54:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oVnribtGvRrx2U99+sp4+4pkR9y3Diock4C2VMk4//I=; b=o7NN3DMRbBRXx2gi
	VU5j8BTAxMMc5atqI3LYHpskCl/6UCWFnYQMlN6kSSnxL4NB6vsqruywF4BcKoJC
	kqAl/7K62ssqXzmvNmn/ufM9zbwz2ux2k88KhulKnP3+57cg/p3RDckgvF10kB9K
	9zOTHO4cC/DmMt/0ZwhqYvHw5MSElt+LAIxgHxsCCeSq+SxgKptwUvir+6Ha2B5O
	yTBjTrE4v4sKpLh/qffMXIb0MVjsQLO4UgcgfBKuGRF43lbr0P+Q0/PWM9L9+3Vk
	eCbveVIiC4nqgHxO1GFAwvRLZyeW3THUMiJyI5x/Lib9iupTMh9qV66MlNpxfmwq
	Km5zhQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47mw30gxc6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Fri, 04 Jul 2025 11:54:55 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4a7ff6ac25bso1156791cf.3
        for <phone-devel@vger.kernel.org>; Fri, 04 Jul 2025 04:54:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751630094; x=1752234894;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oVnribtGvRrx2U99+sp4+4pkR9y3Diock4C2VMk4//I=;
        b=JURF2dkdVU9K4yc4PW6kUEcqdWxmSUxsogDGAHBmYNlL2b4IF1MRakv5L9nKRqZuSx
         3Uj95J2FdZaiY4wPC/MI1kwW9gy5vST2ySXGr711Z8pJjLXUsWffgaK5QXxoSL6bgzza
         KIdXLx893hoIvSvUtCmk+OV6lKAd2g7CGQzzMn2rgU6spKLY618sY1fexlOKjGgF46aP
         IImLGQYkh+pW4HqjrHpn/edpgh+ZDnAybxEYgThLPrpUIYy3VXuevZOGfFgfPUtXH8nS
         8nIgm4mGG1wFB+OscuD0wyJPYXPC/HYzzBVP21rj+rdbjcb3DHTDvzrdlZ3FLzbPHiUK
         nJsQ==
X-Forwarded-Encrypted: i=1; AJvYcCV9edwQotbaBCdYPsILBvPsoTuIHswxQL8BbZK/oteBRlygVTYpBpyjiq4C56kLOCfaPmAbeVs/gYXvZw==@vger.kernel.org
X-Gm-Message-State: AOJu0YydurNKsfbMe2fdm+C9mTw+gAbzOcEDuOjzg2suxyCGM0xpfr4F
	TpvuakPZvActrFuuAJg07a3wfK54Vpwg/FzxNUob/6MDNGVOhw/QQxF+nbeBYntGk0Z8VLEqJpA
	CVSwvWe7qqXX+tDbXdyAXRmAuBN+vZqairIfAh5M+gRcWfk0QIVc/1/kqj4EtdFgBmA==
X-Gm-Gg: ASbGnctUPyjwpzIYZdruseqhTkyt+u22jh+M7NScpqILH/rkSOQaGD7bOeagbnsKZeD
	D3NAbqE+kM6cMIPXHInRjA9RccWKL5FVoLolJdkLmD4j8vV6LZlwlP5V1VZ1UsCfgkWhILNErW0
	33WF1yWVOeNtKthbBIVhHdnffg/n9mtc3rH0DffCFnH7th4nuof7mtLRZ/Ud1hBI0v/nL8FziQH
	WzPAXTo/lP3hgmdHzxR1tzl7fVkaT7bs8wcYDMEQmGoY/+IvVnSS7ULyN0autuCPFEZrZt7itHL
	/fkhPC0UL8YUeI9EssZ2BIR0rQmFg76iCTFEX8ozfmzkwtzfazsbM5Ge7Ff+RNO0CP51g/IJYLY
	nFHVm1w==
X-Received: by 2002:ac8:5812:0:b0:4a7:4eed:6764 with SMTP id d75a77b69052e-4a99775103bmr11746971cf.15.1751630094594;
        Fri, 04 Jul 2025 04:54:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEIKC5nuUHGEaQphhIaG6OtNpGo0pYpdEktZFYxCrH4FwUf0Uz2dPk01S6AnCTwJ8mF/H6C1w==
X-Received: by 2002:ac8:5812:0:b0:4a7:4eed:6764 with SMTP id d75a77b69052e-4a99775103bmr11746751cf.15.1751630094122;
        Fri, 04 Jul 2025 04:54:54 -0700 (PDT)
Received: from [192.168.1.106] (83.9.29.45.neoplus.adsl.tpnet.pl. [83.9.29.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f6b64e9csm157844666b.165.2025.07.04.04.54.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Jul 2025 04:54:53 -0700 (PDT)
Message-ID: <ccd6352d-8c98-45f3-9acb-cd8b2d8d88e5@oss.qualcomm.com>
Date: Fri, 4 Jul 2025 13:54:51 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/11] clk: qcom: Add Video Clock controller (VIDEOCC)
 driver for Milos
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250704-sm7635-clocks-v2-0-9e47a7c0d47f@fairphone.com>
 <20250704-sm7635-clocks-v2-11-9e47a7c0d47f@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250704-sm7635-clocks-v2-11-9e47a7c0d47f@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=CY4I5Krl c=1 sm=1 tr=0 ts=6867c10f cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=qmfFy4ndMtQ753Zl/n/b/A==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8
 a=4HQsANGw-NoHm5yINCEA:9 a=QEXdDO2ut3YA:10 a=AYr37p2UDEkA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-ORIG-GUID: hsmLF3dZBf0TXwzqCAgQ6WuLGYJ-lYeN
X-Proofpoint-GUID: hsmLF3dZBf0TXwzqCAgQ6WuLGYJ-lYeN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA0MDA5MCBTYWx0ZWRfX2x/1QLpFJT+z
 JYEep5JDLEKbVADkqwF/btAVfGdbiCfxO3iUrx8zaA0gWOFllywhc0Vg5mvZFcKtH37BLNfhVla
 jrkldVLzgU0bgWHOoXN5rTVI4JT6myJPmGTyKoaO24tBylDNAyNKRkfS7ksxMr9LcXYzB/cfP9P
 fd6BnOLVEbOickEuERiy+qe/VdzNkNbVguXcs3Bz/TBizJ2qNiaPXXqvZyYxdzf6Qq2YhbjMpA+
 AApqfc2dyPbUH9P0u5o7evVqkNF/azZ0yTpFTNH3xX0GD4m3NQyRPFGQSQvPqa7syZepGxhD2DF
 VO9lvghCdxWbihASq44mfU/2KXVCXLggCOkMWnjvJhCk0fnVjxhQc2OzNNG8PKgEK7o2zcvIazU
 Zq8xaRYhkZ/2FjxWfXTITgxh3WWVFAKawZKPgQstPEaNtr9RtH2Ev4AHsjnnPYnMT6fbfhmf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_04,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=967 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 mlxscore=0 phishscore=0 suspectscore=0 bulkscore=0
 malwarescore=0 impostorscore=0 spamscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507040090



On 04-Jul-25 09:17, Luca Weiss wrote:
> Add support for the video clock controller found on Milos (e.g. SM7635)
> based devices.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
