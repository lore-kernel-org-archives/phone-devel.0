Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7077B2D2393
	for <phone-devel@vger.kernel.org>; Mon, 11 Aug 2025 11:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754911588; cv=none; b=mA72JlMG/xsykq/lnI4pa9T2nHAM5ZkkoZXKSlPgCqIyJVx0sWZZvxwLTcRv+xaz5ZSomRBsEVNPrc1QUJAMemH1jMlG6wVUixRYPUviMcLMrWy9VaMTInDwIx62FObDlbWG4767wi4o3WuEUVP4CiDVLvMfuxql1+AgCWaDEYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754911588; c=relaxed/simple;
	bh=eS4rihNg41CqQLMmI9woJNOTxbkZM5b3UZpiF2Tt2MU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MAImQAh+Nqp/jQDub1a8qCOxHw95eA48nagg0sXD3ao+WLBxwA2B7p7KojE6r3cWQkzvGp3E/0px7RKaGxNoDvOetq2x1jdMORwgtu0vpg/HfGLmG0vavIVBsuefFHexGBvDTfWEbMtFfWcwO+Q1/jAuW28XYnUSKIX4B38fmEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jRje3tkf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jRje3tkf"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57B9dAW7019083
	for <phone-devel@vger.kernel.org>; Mon, 11 Aug 2025 11:26:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7jHNg0B9zA4M2W5qF7j5jLgoieY0vFIuRYMc68TZ4yU=; b=jRje3tkflwZVfifI
	wjIOsh+89MdA4lSahPDOEQQb3BAXSvjMr9C8pQmqbrdTYbJWszsfJEEKpIhMW/cc
	A0GUBASh98xrXokDD7oXeHU2oK3AYEnvFbvSb1M1tChjAsg884N58IA1F2n/L+O7
	xIoF7SDczevL7E4jKjX+0MgzCTGlgnzd9KbDynbRU+198/9KhKIeI2BqhZgB8nQM
	n0giHrYXMWRXpUZxsIqpzzSJUAIy43LzEBF2x4IzjtzY9gSUIrctJGccrH/srylz
	WMGRVqBpCph+0MFEdUksOISaZzyHqAdXiSJauiPpkmow/o0W6/gTOdv97bnbEgtp
	ZISG4Q==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dxduv6jr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Mon, 11 Aug 2025 11:26:26 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4b071271e3eso10909061cf.1
        for <phone-devel@vger.kernel.org>; Mon, 11 Aug 2025 04:26:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754911585; x=1755516385;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7jHNg0B9zA4M2W5qF7j5jLgoieY0vFIuRYMc68TZ4yU=;
        b=vyqGIDOsDh0mNZVHYK4iCiyeTgTqtPScbsWj+yuMYaWEEARzKX1XlDjOZqB1v7mIEP
         ccOmd7lz+sgNTeO8afAhVentAB1wpRrZwpjI/zyC4SXFAcih04nb+L3+nsgUNZ8fLUlZ
         AnHCfxqJOdTF6xVvIdi66iWRfhOse18vZ+WQX/XkGuVIie/FG01+HJA73L8Vms+ry95R
         /W4zGnXm0YL/DSLKn62+P/OOm26t0TMus86pa2feyiDBCIKDEzboIadBN4I4U6BpZKH3
         vAte34Dimy9Q6HiLc/jkoFlYtZnBp656Ly0YQSS8o+Luu4tx6E9v1dCkzhhB3F4NAo+4
         x3qg==
X-Forwarded-Encrypted: i=1; AJvYcCWW8PPvstyCyh+FzmqDik8Q7MUqEyyJdcZfYGRrRD4QX+8HfdN+iW7oo9/GJqrKd4DJJKI5khxNUSB7cw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwEjt0NjXWO+t/HYmMHNvIpu2JRYrt4Nz7t6vWpl5NO5f0rbIOO
	pTTA0LvKMbTuYMSmZTo+KVyisrn+b+b6hy5Gd6FVybP3iR37IVbTCbrfen1B1GDFsmtCNF/3EXT
	XHVydNvG8NUr8jXaY1g7YiULMQcfeVSH6InhctZE1FM5uosbG/qzI/VKHB+Nwl8Vu3w==
X-Gm-Gg: ASbGncvYjYINl9Wm62G/YGr9eqF4MjbYZu+iAQOBCkEUYeaE5X1nsQn+CDK8Tir9fwM
	cBCIhnbWKphnlEZFEZ2naA/eXT6re9Nvpd2fedp/UL+Xl+pIIIiYawTeLPKOFEetnrDAOmLd/G9
	yXBK7/dyZ6T03g+YcmIB6QwGCyprvL6A/+SG8Vhumz9DufB09IDectfCdBSa3k4Z8LKrYKTGvse
	pKkk7cjn5UBPqFWeNocsB+hEAuCSc3i6/OgUWu38Uv07Lmva41H6Bdda8OU/hqFxIE/XXAU4aXP
	1wU8Wx9v9MPJcVi17Q5yyzGLCWESWOw/p6F6dD/Ki2IXe3AHpfconchbqZd2/t4H9jZSfAcAUQY
	AXr4dOjkIrGNAR0qv9A==
X-Received: by 2002:a05:622a:52:b0:4ae:73dc:3896 with SMTP id d75a77b69052e-4b0bed54be4mr48750411cf.12.1754911585065;
        Mon, 11 Aug 2025 04:26:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFdfPZCXPS0OYVaxZhGB2BQD/z043PUiTBUFlrOndzcMXZnRLOEaHOLYJWbIeIJ97eftPoMYQ==
X-Received: by 2002:a05:622a:52:b0:4ae:73dc:3896 with SMTP id d75a77b69052e-4b0bed54be4mr48750211cf.12.1754911584665;
        Mon, 11 Aug 2025 04:26:24 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a21e44csm1987238866b.113.2025.08.11.04.26.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Aug 2025 04:26:24 -0700 (PDT)
Message-ID: <792a342e-0193-4180-b46a-4abc3a55db84@oss.qualcomm.com>
Date: Mon, 11 Aug 2025 13:26:21 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/7] arm64: dts: qcom: msm8953: Add CCI nodes
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
 <20250810-msm8953-cci-v1-5-e83f104cabfc@lucaweiss.eu>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250810-msm8953-cci-v1-5-e83f104cabfc@lucaweiss.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=IuYecK/g c=1 sm=1 tr=0 ts=6899d362 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=dlmhaOwlAAAA:8 a=EUspDBNiAAAA:8
 a=0h-2F_-C1axGQPG-8WYA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
 a=y4cfut4LVr_MrANMpYTh:22
X-Proofpoint-ORIG-GUID: Q0OtTuGQ9zpwZSePqyxyHmvccd9xs3LK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAyNSBTYWx0ZWRfX41y1I1fDlD0D
 AkvV0fIcURTVdXbNm3d28h76+o7c3FQ4kA6TBBl1vY0qXEceIKVgyd/cuUNaAQ3EZgh0lBuwXwC
 iCv4abtaCt3MjflMZ3/YNayV5R3miOmfIEgEZuBIZTXzq4AJ54FhfqyXqVusr5bMvwRhKhSdxrQ
 2gvWHLVbMqBG71LVUkIbHGC4G+j7QogOmyuxgTqbTd1UGuJlMsKlDw26bVNZTbU+mn1w9XslcJy
 BqZcuXebq2TjWplhNgYMxuM9a6Y7f3U4+WzhdVhJTUvZ7nWYKsmEHWID1exf78buwTq/pzNEB4B
 GZJxGOyviJ5Zgzq559Qt3P6v7OQ0cwYpyE0dUioTJaaGzUyf3ZWR3ILXvhqmdT48CTGfq5pgHuX
 sw0Aq6+I
X-Proofpoint-GUID: Q0OtTuGQ9zpwZSePqyxyHmvccd9xs3LK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-11_02,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 phishscore=0 suspectscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090025

On 8/10/25 5:37 PM, Luca Weiss wrote:
> Add the nodes for the camera I2C bus on the MSM8953 SoC.
> 
> Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
