Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B5301D88AC
	for <phone-devel@vger.kernel.org>; Thu, 29 Jan 2026 00:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769647589; cv=none; b=pjyil0KxFTVuMQgNj1g81fCVEF3brnoS5u2ORfKAfupqtnG+R9tBtK7iLy0ONOgfeYUlApGb/ouJR8vw/CNQ5J/4G7Wjk6J/Tn9Jt3w5WUDZ+MrnSw7nerkt9MNqQKNJGHeEyn+NI3woGRrKor42DHU6yU/wgZYtH07e5vRMTyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769647589; c=relaxed/simple;
	bh=tJl8AmnkxVmtzONaPOUMaRuyfFa+3zLHTQjBIOt0jsY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V4rGWp5a3MJ8SUdgJPTPmIVhcdmzHtfXfbGJxX2yKFgvhwZeAhBvUl8Q+bFQcHuehbSXmgOOvB79pJgBHBoAVTXCzmoNFKxDybjH7Rzt2XkUikprh7qY4p7rwys/qBrkhi9YrjzFjxffBp0VEVQf0m5j/m60Adgib/fp8Pp7ZN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K7K2Dy2G; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iSBSKRYU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K7K2Dy2G";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iSBSKRYU"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60SH3B7L895849
	for <phone-devel@vger.kernel.org>; Thu, 29 Jan 2026 00:46:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=AtIWJ2oqLHCj7NU8VYbYUvp0
	nuWKS9o2KY3yqQqtkfY=; b=K7K2Dy2G36aDYEkBEnUzco8YhItDhLxt5MDMCjvT
	k0hChKdVfKZxZMGUNlzpmsdXLsRc8e1zrGBCmQGU/5pXTm/38ho5U07Cf3aEEo6F
	RzWGoHHUiau5Fv0pHhUHLnXhezs6VIhQK0dS4ZKLtp4RRvBsj14oVk3oHZGeU3Xc
	rKli40BaUekCHwWSnfjPa1krYTOVZcvSDMatfCuWb94UmksRKOUQ1DndZWu/asYA
	85OwbQVNJ+utqM6G9MEuM8aQf9QeBIve8ROxuZRJTlReQWk8Qw0mi6ehsgZ5Y3do
	DlBXFE8uS7dhJEwTCfm6i731t+ZpVtDW5k0mhq2Jp75OSg==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4byph39bp0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Thu, 29 Jan 2026 00:46:26 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5635d2bec8bso1141337e0c.0
        for <phone-devel@vger.kernel.org>; Wed, 28 Jan 2026 16:46:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769647585; x=1770252385; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AtIWJ2oqLHCj7NU8VYbYUvp0nuWKS9o2KY3yqQqtkfY=;
        b=iSBSKRYUzS/k8ccUqgG+Xh7Wh9H9HFbKDZxo5ztnU+Gyoko8072RYz7pmLWczL+XQU
         uSNcKOjko98m4EEg0nSlerJk1O59yZ6h8q5CvSTFYlg78BCMtRcqjBveUfGuOZFWK0tN
         WTZqUhmfu7/4GnluXMeW4Q9PrFijbTYKtYO4XK9KCQ5JgDOY1d/drn1a/53tIixTLV/P
         p75Q8tpJJwXrWHKbn0K6wQoukH/O+O5V+QTrYYZ5KfWYy+YT7zSVvFxIh9abWj8EYREw
         2uJd/P6x7zw6UWp0hU7r0xFfv7nvxm+c6PwhBswu5CkKEm7LMswbowXGbISsevuV5mz4
         2GIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769647585; x=1770252385;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AtIWJ2oqLHCj7NU8VYbYUvp0nuWKS9o2KY3yqQqtkfY=;
        b=H6C11AibnsolDrzXgKj+coTL03g1Q6XTk9im4IiNOa13XzXGXqQKeL9QMSj9tt+O0B
         WVCjNvGLINzeCNQuPf2r6SJyGkcX2oATtmEHzCrex/MojTOnPc1z5oTfRJXMSJruAgKY
         eWEbGqO2ef3BZvDmucI4XXOf6j6lMR4fET7SgP5OOU8CobH6azGfCcz1KtrqFuu1gzu7
         s2qOCN5oTzTE5MYNEKWUCUDMau5dEKOmFJIkct2+2myg03/0zVYwBgqCKq6ETZE7nGKK
         r6M8grbA4QA307Ezt4FRjAlCWx5xF6j9WWuxHcg4fzR6IncXHmJutYyb/G1qt7iEjHln
         qpXw==
X-Forwarded-Encrypted: i=1; AJvYcCXgujG9GREsumB2QILWpvTmoaFUR8nY4Z73hMe8cnf4NTK++tBLZX4axiVL6k9rMgx9be+FHe58EOLOuQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy83cvA5bXCyAHcBxSAXeYmeXnLpLQphUg/YOCuB1WyTipBHYjT
	LHr+07nEUNTh+iHjnklv0IICy+o6hyd2KrxIXakO7wVUmZanI1bckKYEiR0KkfRvcGZKf0MMi3F
	nKy91oqsfD3ON4/1jJvJeCRr+jU8k/yXVQf1iPPH1v9LFOGy+aoeCmVAoltB/bQT/EQ==
X-Gm-Gg: AZuq6aI8eTd1bOL8WffgII9j4c4DUsRxEaBEw5h2qsZYgVKIOa/xJ+sQ+WNyxW+ia7L
	M5PH/QyEdseWD7m0KYKoLznxagSIN+PfauQy+//CrtZHKTWP7IQt8AvgMBn94v+spYwWCPgy36/
	k8zJd0QReg00o7kxWkEUAZ9qiIXVqWvBRCczJi9JD8x0UMsOTa12Ttm6/WsxIRmYRX8odrgl2GV
	5jvDqsMa+OBo1+Y56goSLeFMk17JM6W0kec2/rWp1Xyr3fJF9lAnKKXUpD5tnSDzlG23CshQoAI
	3i0Vo25CosKHADvBEL+zsGyyIqrt1eLSm6QaJIjd2cUfa2wdt+nZ7UPMWeZ+PH4OwGUxE1J3PHl
	JgUt+hGnPZFYW3C9Xvw7nSUHxaVwOpUBFJGexzGl/WHOQeLYkwichGrujmxKbhH6f8Ebt2D/738
	pjjWeXXjQbKvChCk7j+pZK67I=
X-Received: by 2002:a05:6102:1686:b0:5f7:2430:5340 with SMTP id ada2fe7eead31-5f7243053a4mr2194504137.21.1769647585512;
        Wed, 28 Jan 2026 16:46:25 -0800 (PST)
X-Received: by 2002:a05:6102:1686:b0:5f7:2430:5340 with SMTP id ada2fe7eead31-5f7243053a4mr2194497137.21.1769647585118;
        Wed, 28 Jan 2026 16:46:25 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e074b7033sm821873e87.68.2026.01.28.16.46.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 16:46:24 -0800 (PST)
Date: Thu, 29 Jan 2026 02:46:23 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] pinctrl: qcom: sm8250-lpass-lpi: Fix i2s2_data_groups
 definition
Message-ID: <imqu7bovwwqycci3w5myjgdbdnsz5ol3meavdu6tgfixpr7hvz@hhwobvjxqoqb>
References: <20260128-sm8250-lpass-lpi-fix-v1-1-8e68f47dfeb4@fairphone.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260128-sm8250-lpass-lpi-fix-v1-1-8e68f47dfeb4@fairphone.com>
X-Authority-Analysis: v=2.4 cv=Z93h3XRA c=1 sm=1 tr=0 ts=697aade2 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=KqVGvLWFIAZGjLrJOEQA:9 a=CjuIK1q_8ugA:10
 a=hhpmQAJR8DioWGSBphRh:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-ORIG-GUID: Kz4vqpMw92_lfJjqi-8c3-yHmvuwltLW
X-Proofpoint-GUID: Kz4vqpMw92_lfJjqi-8c3-yHmvuwltLW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI5MDAwMyBTYWx0ZWRfX4NFswib/2g6M
 93oQzLltyzPE7qPppiHMcpYDqLNPAznFHobyp6RjDeMuQAQL5KHDex/YSd+36CRiDr+noYCGzhA
 kkLfZHZE7gHSgsfyvG39z8KDusG8Vlh64RCIGTJbvqZWDEodRDxI5XmazvXaRCno8Z26M9/25XA
 sk3mYoV+FeqMM2AISdwZee1j5PRf5QB07t5N8h2R7DZfzFp3Rt3DrsCXjpGjdef0CurGEhSzEp9
 +SeyMROntQjVIQ+Vt+Djt3NN95cbYfRsN93zlrwCqODl6i1EOKc4sZxDZ/uHqfkXYnxaWhQhC3V
 5E6vCQ4H5AQqb4xPM8YfBLA9H2HrTP6kgeXpNqsLPlJ8gzRZMhsAVPGDctIEpYfK9Nd9RKEe+tp
 4nP4XGUJikaOUTQseNavdoqIpdGGsM1gfM1kawxdmLoF3Hpo33Ydflpees/g3rpW6l6RiprM3iJ
 DyiJlxtlkiYqZM2k9yw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-28_06,2026-01-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 adultscore=0 clxscore=1015
 phishscore=0 spamscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601290003

On Wed, Jan 28, 2026 at 12:22:28PM +0100, Luca Weiss wrote:
> The i2s2_data function is available on both gpio12 and gpio13. Fix the
> groups definition.
> 
> Fixes: 6e261d1090d6 ("pinctrl: qcom: Add sm8250 lpass lpi pinctrl driver")
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  drivers/pinctrl/qcom/pinctrl-sm8250-lpass-lpi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
