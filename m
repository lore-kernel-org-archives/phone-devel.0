Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 324C13E4500
	for <phone-devel@vger.kernel.org>; Mon, 13 Jul 2026 10:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783939821; cv=none; b=GD5VFoEdLVeY9enoVJeVkdQNDBfH1nTED+0Addf6sHwd3mPmklgQi9VBvGAaGFkybOVVBjKdiPA9w3D0jLqBNPkApT2gor2yg3AiIjTFvJEaTgcnYEuksFSNl609J7E+MYInufiEWoi6v0oey8ZvIQiPrOZJSKAIonWoV1iXJ2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783939821; c=relaxed/simple;
	bh=Vh2sWX1iyHi9Tw+t86WJ+jfswAcvxYFSL2CPGjT58ZE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z7m7vTT0ADKgzfVaCmR+9dpl+Xa8lidXG2JawlQ9IemzhBF/HBptu00KVkAIY8cy2oZAGZzHuKcKvhp23CRlp6shRpowa4ensHAHOxwPDYfc9JQ2FvfK8YdF/gmxuvhEhlRXGDCoZyj5mfN5bwCRoqSkNV10deKPqNaKXxmefCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A+kFtuhG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Utvv/NL/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A+kFtuhG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Utvv/NL/"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D6NhEP507010
	for <phone-devel@vger.kernel.org>; Mon, 13 Jul 2026 10:50:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OEf9r2CGUDDvdRTVlkeJE3LCyB6+x1X6aW6SrYpfnPM=; b=A+kFtuhGIQ5g3B9F
	8Ys+YJmsUnQkhIhiE5p8bOrhfpd7AeMzmnJMRZlzn7QCnc6xRV7EyvtLaYW72R3B
	ZTXe/SzZ9mnWr861xgCXBL6R4HLjk1iqO7v1NmYYLUqI3WLbrCWCDoizg887Jpv9
	S/wOed+SL7F1rgnrACNDt6DqKVWqE1wPO7TNY1FLpOCmg+l8kCUjZNmHPaJIhQAo
	mYdnUlYWDBvBG7yUSD3LPdmhy/HRG4BZqUQgvj/qRTWkguNL/VCUJ+7+RRKxWU68
	NVFj99ecao53OOM+L4fMVGd16NWGmLjH0kqd2N2vXZuULhzckXI4EME5EKl2+JnH
	pJQC3w==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fctc8h4ab-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Mon, 13 Jul 2026 10:50:19 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8ee7cd05e18so6851346d6.0
        for <phone-devel@vger.kernel.org>; Mon, 13 Jul 2026 03:50:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783939818; x=1784544618; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OEf9r2CGUDDvdRTVlkeJE3LCyB6+x1X6aW6SrYpfnPM=;
        b=Utvv/NL/GX2lFK5hLXmMzXbVlxikUTOGVuZTEqvaT8ElmOU5SJ1BNHUHarL/iDtNlU
         wMeHRQYWoZ1ldvXTNL+9tirbYNqu8cdiyTdwfqFVlVr0nTtL85MJ8xabNh5bPYNsuQzS
         Mtj4SSaUK5WyLKIwjvuUg+i9kGUsIz6kjtPgpAXPEWRJqWiW2bosCqY/C28yVSYu9DsN
         cSdhJYr5LriDXyxOtxUHPBrXw8fKFxuK/Fu/hYDUhslKxpFOTvdreMOTdyXN7uGYRTS/
         b5KWgwVMKRvFPXcIxO18d+f4HKB7ZNSvEsI4MBv5/el1AdzFm4TqbVcQt7AU+d3ocKAA
         6GEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783939818; x=1784544618;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OEf9r2CGUDDvdRTVlkeJE3LCyB6+x1X6aW6SrYpfnPM=;
        b=kPb9R0VC0sn7JTIbZU5oeTTP9bee/JO5zqP+vUEjMSGlvgwNMHKgolgqA9YkMntzn1
         JT28AvIXfnlkYY9GE1Uo8VEPo2UBD/FUUkP76FwxHJBgTZ4g0eDIWcpIF0PkKOMG2VjV
         HctCXvJtY6bMGOe5YLYjrW72+Mu5W/WecNXQjYA0B8W51MBqe9Q0d7jRUHqD7Mz/H8J7
         4np5zwEgnzk1dJZp9HXkloQjuf5k6dW3TSg+q8tRArwwR/tX8ErMChEIE+zBNnvShe9I
         cX3pgduLWOi5F6lz5h9UB6Wqvvx+FALv3Vix9dAydHrHUeviKpNvHRBsO8jNRrb/ymu0
         zrPA==
X-Forwarded-Encrypted: i=1; AHgh+Ro5Aq4wvS2SbSpkFm3T6ONMMUIA+dX++j3765ecnM68LayIvAYkVSIBru5FMggJH9I4c79CklzXMHIMSA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0g1kbWFih+LtjJ/ZV+qrfpc6fR0EI6CaGIanZ7fy3BnMVFKVC
	mdkNlwc+7lmqrv1WcAp6wl5xcepo5uj+XGjfX9TOmXjdjRjOxPr4nykpMJaWUswUcbMgnzzAPLK
	4MuEd/yXG+KnwsnidRVeTveuHLMmj4vGG2hOqR7SN0kfTf6Pfer2PF/plGKTS1mh26g==
X-Gm-Gg: AfdE7ck6zVyk/Y0k5rMFFzYafDBC6+3+ObOyCRr9Vfi4huq1k5YDdDLhvlxlQ2j+3Ol
	FAoBgs2sUd2Ysw9VgOSoqLfnISBUykqbib0hGQhFJwBt+xFozpv/0YKck72KP6lD8Uc0rB/c9kZ
	uTu6vRzQ8kE3zhoeID3YAdLuNAHZ5nVay5pl+6OBeOPQp3iYRVWJYuXIvflTFqVvO+GlVLvf8Nz
	b5YTyjueyZhr0vvqY4YoHKZggOQd03254DVOVkmtOi1iKmLBEfAhg/UXFltzZCLPv7FZCuvwLb0
	XQBZL+8iuQjmldzf6tuGiTUcy8+iKxJF1g01lpaSFDI3SylNqHx2t3HkcPvC/DqDuOIcmJCztYD
	ip0XuKme9wwoKa8OYsV4WtmCmyrVmDz9VL7Y=
X-Received: by 2002:a05:620a:440e:b0:926:e8e6:3c28 with SMTP id af79cd13be357-92ef2cb409bmr567815385a.7.1783939818531;
        Mon, 13 Jul 2026 03:50:18 -0700 (PDT)
X-Received: by 2002:a05:620a:440e:b0:926:e8e6:3c28 with SMTP id af79cd13be357-92ef2cb409bmr567813285a.7.1783939818123;
        Mon, 13 Jul 2026 03:50:18 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15e19cb6c0sm631526866b.26.2026.07.13.03.50.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 03:50:17 -0700 (PDT)
Message-ID: <6052772a-bcf0-4e23-89c6-9516a6f68f20@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 12:50:14 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] clk: qcom: dispcc-sm8450: Fix
 disp_cc_mdss_mdp_clk_src ops
To: esteuwu@proton.me, Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Danila Tikhonov <danila@jiaxyga.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
References: <20260711-sm8450-qol-dispcc-v2-0-fc1a07ac5601@proton.me>
 <20260711-sm8450-qol-dispcc-v2-1-fc1a07ac5601@proton.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260711-sm8450-qol-dispcc-v2-1-fc1a07ac5601@proton.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: RUXV6-LOM5XvjvrK27vm7goxHepkYHYp
X-Proofpoint-ORIG-GUID: RUXV6-LOM5XvjvrK27vm7goxHepkYHYp
X-Authority-Analysis: v=2.4 cv=UtRT8ewB c=1 sm=1 tr=0 ts=6a54c2eb cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=LLcCrvt9GrqY8lSa8nIA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDExMiBTYWx0ZWRfX2d8XLtVekskg
 GTAvpXFI8upnu6LdRJMoNBNFKBhm6D6qiPMQWyMZzXkfE3bKtQ1hurHuJxC+xg1QIh9hJG1wJWS
 qN53LO8JmTDcN68HXgROS811VuNiBbQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDExMiBTYWx0ZWRfX8tDVWhtaLHY8
 pagT/V3+vOPUxZIn+6VllwN2eLrajZTGys/rEA3UdH0P/bgcj734xgUzuXiknOkkYLq+T+CwxfN
 /ueLgmurFyvJwgF/k0WDzKK5cvD4MLkEVjz6lHvJvP7fF39PUQdCaGX1LyP0hJTDrVQ/3YxT1/Z
 YODGFDJVvu8T1nqlJcQ8hTpSuLtwvtooHl79twWYT+wtHVYznFmuGopKFgKsfm2XndudYdUj6NG
 8nQyUPWNbgsEf0U+JucjUf1wazOdwQeSXlp/OVu7Dv45YIvbzogebPJwzVypvr4HNaZXW8FzgfW
 N7t2xT82Uht8ZHk/fEJYnWmCBteAlta0P2J7G78dXuet7/NOqC5VXNCqm3gz5frG+rI6nNh1M0g
 M5cg6+WnDk57+3H+rghaS/9jE7IKgUsXxwYrPo8/4KmqopL3Ch9O3WhqmFPXnc7PSzS1c+K+S/z
 58i4L3N4tNQ9ZE089yQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 suspectscore=0 bulkscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130112

On 7/12/26 5:10 AM, Esteban Urrutia via B4 Relay wrote:
> From: Esteban Urrutia <esteuwu@proton.me>
> 
> If the clock frequency is changed at registration time, a flicker will be
> visible at boot.
> Switching to clk_rcg2_shared_no_init_park_ops fixes this.
> 
> Fixes: 16fb89f92ec4 ("clk: qcom: Add support for Display Clock Controller on SM8450")
> Signed-off-by: Esteban Urrutia <esteuwu@proton.me>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
