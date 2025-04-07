Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D9FC2253B2
	for <phone-devel@vger.kernel.org>; Mon,  7 Apr 2025 08:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744015803; cv=none; b=RTvF4ybi2LlzLq1GlNCEnkLtXVkIt1EsF57ow00bSRKhjYqhcuSm4rT6QB1gJ+pHxOc9SSUkG2d/ETQYJeC8qYcUQ4N7Y1HbUJH38gRe/tRKtqrJ6VVaiRCPSvEipgOstsrWo/+t7pYY6jgsi3xmTaZIYlJt2ICf25O/tpz63EE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744015803; c=relaxed/simple;
	bh=0dysb/j8QCvtqSojYzmzZc4MuE8IlG7SThXAVqAXz34=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZVE4YYtot58hOP0/JhuoOuoKOMPOlrZo7WOtIoAxZV7kiUj1WbZ5W53f/UbmCqjlfSQtDSyOTz3QfCpmdOoozG2+HIM26J8/tqSiimChm4mpGDfi9IVw1wf8QpuwHpNorRF5Xa01npM2kcjZZufjI1wPshseUtlMJxMOJhL2bk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CVVDZL/g; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CVVDZL/g"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5378dlkf010401
	for <phone-devel@vger.kernel.org>; Mon, 7 Apr 2025 08:50:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	A7W/suLq2UM8HkanTs1604dpOyHgBjMoRJIiCRyj9+s=; b=CVVDZL/gws/Rm+jT
	YWCrTw9nhBzrno64L/nvG3wxIxarrWOLWV/RhmuPrTZ4uA/GkKdNvaDa25pR5lVT
	WIi1R+8kUyxISodhlpcpZwEVdKIGZTbOCjNoM1bWOTznfU1IaBj7lNsy1ecjOnTB
	wMv+bUs4AM/UyiLPhVuvWE3xV9VXuCFGhgkSWYdvGscXy1oGaoT5Pd4D55dGoyrq
	OwkC/NYXb/HZ5nWb3bBxknxfBtzRjwy6Nub+5Zvz9dTMiABGhd3lxUpKGLeqEl4y
	MDxoOChXlFyEhwHTM7OskUXKfWQTreg851nWAjUkGAgBDWAsxYIPdwgaABaG0Lqr
	LYHTmQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twd2kn32-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Mon, 07 Apr 2025 08:50:01 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6ece59c3108so9376396d6.2
        for <phone-devel@vger.kernel.org>; Mon, 07 Apr 2025 01:50:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744015800; x=1744620600;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=A7W/suLq2UM8HkanTs1604dpOyHgBjMoRJIiCRyj9+s=;
        b=BOrnGhldrxCRXYkdfAXCWboFiV8XcYMKejCUcElU9b7KSca8r7yQvijSDANcmdzX+c
         cNmlNzjpnG3zlWdTK8Z5nT95g8JbW2lmm7U8174JD4WSptnjoe2xQQomZpFunukBxPQd
         jNdBb4Sx8+OR0og34yj8Odb18Mi9L9rgdUDX93rV40Pn+v4Q7zHFFt7hevt1CIRtlWzJ
         aFVYVV9MorVi3UQSmQk8S+jhkHt7rQLBrO1i9Kfy0ApMfdHArbmXrcfIX/xs4vS5qXJM
         04hQP6lsUVGPErHsefdstYJxWB1V6z4thsQbpkGE8XEMTmnTFVZKrMYgQL1UEbS0c/A6
         NGLQ==
X-Forwarded-Encrypted: i=1; AJvYcCXrx8J1Ir6Z3RSlZq9Kt0VWRRvohwNgD2jTwfHIn/uJEZmhwLMaBG/faP6+cIB6eIctcOY4hqgEjJeQcw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzPcVCsy1oEtEI6ZwNz/rh4kDCDeGGdSh3ATmql4K/PeLerLJ4s
	Q7TeFDmRpsIukJVz7EJmKw6G28n1N14ZRxRgEtYwmqd3H0ZMAUhZ5is54ICZYuwqkR4vkg3WbeM
	0rpiYIGYekpsb9nOMEGPhY6qvjlo8EMU9gxzr4UJwXnoQuXBY100nscOAJG2wZQ==
X-Gm-Gg: ASbGncsZ3N1S9fof89cNszenKbDoLPTi4K8lGvgSwjG3bBYRKgdl4UJmA8NJs6biLH5
	XR1ikkYrJABJR5dSciYpHz6TFJY7FoZ34R95JmvVmXMgUKFtRkE3s736Vc0k921ZvHyivkM2jdk
	U79UAXZtawm0gs1NgalVqQVzzaobs51Yj+fRUoSBn50ltT55cqew97mzzRWDEeUzo/8cO5ZKnN/
	mFcYmSGraNo6av8Hu/i0iz+MDW/zhsAgru61TCGlw2I/Cr+HAz+D5NQCYdkdchIMffbRApw8ir9
	2ybzHzprH8Zv9GyUYgY8Tt8bBOIm19Y+nMX+RDwnSopfAC45ohBO4X2l7KGZ+L4lO+IFGA==
X-Received: by 2002:a05:620a:454e:b0:7c0:c42a:707d with SMTP id af79cd13be357-7c774def534mr617001785a.15.1744015800116;
        Mon, 07 Apr 2025 01:50:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHM3ImiIeUKkCnXzozuTunhbkQzhWJNYwKRsFjSxrcYnNZn6j0yjPM2Ovp2gCk1ymCBdM3FPw==
X-Received: by 2002:a05:620a:454e:b0:7c0:c42a:707d with SMTP id af79cd13be357-7c774def534mr617000985a.15.1744015799813;
        Mon, 07 Apr 2025 01:49:59 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f0880a55aasm6468304a12.78.2025.04.07.01.49.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Apr 2025 01:49:59 -0700 (PDT)
Message-ID: <9583f74f-2dce-4535-bdff-92b1da1566b5@oss.qualcomm.com>
Date: Mon, 7 Apr 2025 10:49:55 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: msm8953: Add interconnects
To: Luca Weiss <luca@lucaweiss.eu>, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vladimir Lypak <vladimir.lypak@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250406-msm8953-interconnect-v1-0-a23e22e236e0@lucaweiss.eu>
 <20250406-msm8953-interconnect-v1-2-a23e22e236e0@lucaweiss.eu>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250406-msm8953-interconnect-v1-2-a23e22e236e0@lucaweiss.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: gCBqhgQZzOOuUMfWKdZJjcXHWhLhU8Z0
X-Proofpoint-GUID: gCBqhgQZzOOuUMfWKdZJjcXHWhLhU8Z0
X-Authority-Analysis: v=2.4 cv=NaLm13D4 c=1 sm=1 tr=0 ts=67f391b9 cx=c_pps a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=pGLkceISAAAA:8 a=dlmhaOwlAAAA:8 a=Dw-YgVe96UOjDrfUO-cA:9 a=QZKuY7mROTJmt8fO:21
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22 a=y4cfut4LVr_MrANMpYTh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-07_02,2025-04-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 mlxlogscore=999 clxscore=1015 phishscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504070062

On 4/6/25 10:55 PM, Luca Weiss wrote:
> From: Vladimir Lypak <vladimir.lypak@gmail.com>
> 
> Add the nodes for the bimc, pcnoc, snoc and snoc_mm. And wire up the
> interconnects where applicable.
> 
> Signed-off-by: Vladimir Lypak <vladimir.lypak@gmail.com>
> [luca: Prepare patch for upstream submission]
> Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
> ---

[...]

> +			interconnects = <&snoc_mm MAS_MDP RPM_ACTIVE_TAG
> +					 &bimc SLV_EBI RPM_ACTIVE_TAG>,
> +					<&bimc MAS_APPS_PROC RPM_ACTIVE_TAG
> +					 &pcnoc SLV_DISP_SS_CFG RPM_ACTIVE_TAG>;

RPM_ACTIVE_TAG is akin to QCOM_ICC_TAG_ACTIVE_ONLY, keep it on the CPUs
and on the cpu-cfg paths, use RPM_ALWAYS_TAG otherwise

Konrad
