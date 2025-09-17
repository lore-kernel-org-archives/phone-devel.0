Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 788232EC0A5
	for <phone-devel@vger.kernel.org>; Wed, 17 Sep 2025 13:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758116564; cv=none; b=mnciNJMHrGq0DLu2Zswn6bCPpIe/6B+jagG86h+1lyp5csTsrTFhDmeVPF1Cn6F2P5ribjM+3tLGIap9KM1sA5/9Bp8ugU8YWIwDzj4iFYETMG0Yp9B/efvRr9gGeHw9UDgyMYpxBAIkXJIE7ATD+NqpHFbLHd7pD42VvXZL2uU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758116564; c=relaxed/simple;
	bh=P+9qcWp7nB0G0Mpnq9jRPgAMimjFqsKqmE3zBJHHxVs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s7E/1WYcLMCGtbm6bpqj/uTuppSxCy7E1F0xG7Aoy+OxuBE05h6+YzsYSfilq1O4e2qynr7aMAYSwORMqfphl6lc0vrGTME1Cs5KPqd37ygfD0ZCHN9393tN7/e4g7r5cbjKz4Z6k2LKHBDf1e5sNl4T+eeDje3LQzXr6SnI8SA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XH8q3UQG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XH8q3UQG"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58H8XpYs000824
	for <phone-devel@vger.kernel.org>; Wed, 17 Sep 2025 13:42:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7Cx+H6Um1G2JkJ5lXuXrB3HDUnwL0tqqkEuYb++6Iqc=; b=XH8q3UQGN4npAmut
	Iry8oafb4OgpvTI/IgVcqFheSyrG1AIuEg7/bO3mRz8Lo2sqz/gYNodPwtSG7VHO
	eboGISUmrC6mWfGj5IHR/LCpvh8g/iI03vxlt94ee1xdTh9SSYXV+IgBeRAUicDw
	Telxd2JP3heNxSf35v3Lo5w0sOICXpE6q7PgvF7/z/A+C4ld5RrKovlFvOxhaJ5E
	60z/ojoG5HhlkLncfjaGws6My47vKeUsdj/Fga8zKjLojMSWCYxcYhBiRnMt/pNK
	nNrjbD1NU0yeLstflcr94xeLLpjF9JbLcA79XRTVVrIPFwLM+j3o4O2CJJcWXxN/
	+Zw/Gg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497fxyjhyy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Wed, 17 Sep 2025 13:42:42 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4b77da4b375so15737501cf.2
        for <phone-devel@vger.kernel.org>; Wed, 17 Sep 2025 06:42:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758116561; x=1758721361;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7Cx+H6Um1G2JkJ5lXuXrB3HDUnwL0tqqkEuYb++6Iqc=;
        b=MCVsdGeWF+0pARsy0XdR/UyUlkDF2sNfNbGG0/RRS48oBLrkm1jYNbBmKViw5BXh6R
         6QAn5ydZxZ/JekopbscJciuqNf37FGmEWsYpC3M6lKDf7IaHBAcRSTdmv35UnwK2yoIL
         WOeT1lgVSalDJ9Un/339RaiDrX1crqlIqUfYHEBYg78YyuDN2VHRdekleX7JjNeSDgBM
         h1Fz83bUxmsV9zgD9H2oiFstifKAgNXfFj0+NySwrXrPvtElu/d69ZC5D6OWRzk3W6P6
         VfJuDGRn4lbnogTOiSZbad+rhm+Cwoq9zSW8JwUi7JyFBa7Oik7xyuTk2jpLH3WSgHvp
         WXcg==
X-Forwarded-Encrypted: i=1; AJvYcCX4QZcVJJOOCP95Jzgcr9jiXjVmNb6iEhyham5bqxqyCfEl4k+HSdYe7BtpwSH60NS0/45wJnugJy+gsQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxT8Q31GYHGBL93x1DB3zWp2rNwT32/7r2EUgc3LtrQ7341iZde
	JdBkYIverbDkqTGsX/9rOXcxhl/CwU4hSrqzZ0WbHA11uNpFvFDdEHxvnF+nNxMieQtVBge7Fqt
	wm9g/m5/O3TPaeizO7bcHadpBeOf9xgXQ9PZJEttXg5vgcpEHyMygtxXcpqiBYxtaJ4xILaiCkQ
	==
X-Gm-Gg: ASbGncvjvbjgtNGHft4fTo6JSgDAxZZf1Ua/XoloEq89IzajyAXTAh+E/77BP6NXoDh
	34XCN2Pw4wkHc2e+HlS/TF6Bi9exCsM0nTm9KL61Us6K0xGrD799OFkX28cK434w/AuWA8lWtPN
	jvyUy7OBhzcfbAHGkJwISYCdKJakQUuhgGNh1ORLf24DdlYGz1LpDbJ7OQ2TL+2pl7oqtPUUTHD
	8wp7L4iWmbtqFfj0u7mdmm3Z37f2Q/yjP5L2LYcvAzyrXYfXj8qRBDFGgZldntH3tUt8JssdpM/
	gsWr3+FglVsDWFu0TDKGdWaBzE40uvDY3coaqorZH0fE3GesBfB4I+UCQ4jkgdmT4leEw7MzoYF
	qqFVjVX+8hLfbWtcEkcbH7A==
X-Received: by 2002:ac8:7dcf:0:b0:4b3:d90:7b6f with SMTP id d75a77b69052e-4ba67f67aa6mr13897791cf.6.1758116561179;
        Wed, 17 Sep 2025 06:42:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG6it76BiV965uXbpKVk7JtT8JZF7WpBlguxShW0UZUk8ZurX542X6H7QXGdtmz2SFxYB8vLg==
X-Received: by 2002:ac8:7dcf:0:b0:4b3:d90:7b6f with SMTP id d75a77b69052e-4ba67f67aa6mr13897431cf.6.1758116560435;
        Wed, 17 Sep 2025 06:42:40 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07b32dd408sm1364974666b.59.2025.09.17.06.42.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Sep 2025 06:42:39 -0700 (PDT)
Message-ID: <7380300d-9642-43fc-96c7-a2a42bef5bf4@oss.qualcomm.com>
Date: Wed, 17 Sep 2025 15:42:37 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/13] arm64: dts: qcom: sdm845-lg-common: Add leds
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
References: <20250916-judyln-dts-v2-0-5e16e60263af@postmarketos.org>
 <20250916-judyln-dts-v2-4-5e16e60263af@postmarketos.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250916-judyln-dts-v2-4-5e16e60263af@postmarketos.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=e50GSbp/ c=1 sm=1 tr=0 ts=68cabad2 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=sfOm8-O8AAAA:8 a=Aa-MDpYJ7-4v3bfwBlMA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22 a=TvTJqdcANYtsRzA46cdi:22
X-Proofpoint-GUID: mBT57UpALcfnsrvN5LA-M34VOyAdqKtY
X-Proofpoint-ORIG-GUID: mBT57UpALcfnsrvN5LA-M34VOyAdqKtY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfX3EqvdtLIpsjm
 2ceD0S0azLMcxxEaAxk/w7yYQ+TS6pN1X8xTxrB1gLqhLhyfGFlXXqX42k05G5yDokrkruUhPs6
 qEO1MatfXs6fk1Ebj6kyTtEcJSFQDdQu8qr5XH43gQ+BsF8jQ5OzVHrNsHu4Sizprj+NX/9Ktxc
 /3lqTDNfBiKLU3SaHThZ4GeOcuYah8H5FGUtCLOLygl08a6pStUYGOqEkJTaNf4v2CWSUoPjAFe
 wkGKPpgt4b/2svwteXoW9pQQhRhEjE2A9LII+JgTgfxVbKQuMbGNAFGPNW1S4kMYDXqzMSrOXKA
 WkKsbkNN9zXCGRshu9c453L2FulbTwKHTje8+CO4odnduZ9WJHGzr2Uxyih8OXSys2dObD6KuoO
 n8WNDQBJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-17_01,2025-09-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 clxscore=1011 spamscore=0 priorityscore=1501
 phishscore=0 malwarescore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509160202

On 9/17/25 3:09 AM, Paul Sajna wrote:
> From: Amir Dahan <system64fumo@protonmail.com>
> 
> Add the multicolor status led in the phone's notch
> 
> Signed-off-by: Amir Dahan <system64fumo@protonmail.com>

Sending someone else's changes is fine, but Linux submission guidelines
require that you add your own sign-off at the end of the existing tag
chain (i.e. git commit --amend -s) to certify under your name that you
believe a patch doesn't e.g. break any licensing

Konrad
