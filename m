Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A17B231A3B
	for <phone-devel@vger.kernel.org>; Tue, 17 Feb 2026 07:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771313876; cv=none; b=Tr7EQLzBc3/o/oBcvzxsFhz9KoqyE/vmlvjZvzhjMEyHiA/vfRl3pbl968EqXHSIYyvCqzfWNdlsrXlTJ41NEuetoYCbKAzaqy6OowD18C/XENoffskEtOF0fKuadKZfixfp638zKfXu90PnpOb4TSi7tTlQhs+ieOzDjlFF+4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771313876; c=relaxed/simple;
	bh=y6lCjflSgJPPFMmlFO3Pc1EIf3s6AYfeHGJLPlnGntw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wm3QAVQ1uKHwN2O3IxsA4SG9NrdJUo5/4qdKL+UWsFjs34pPsmAzk0AuV5i4kisme2T0BegQyvLYjisJr6I7BCBI9RsliMlbzGQODaFjXvFKHbsfzJOlc7pe1x5jOsn12hKqgDFJxjrgzaDlGgKNLn3HPWn3nXSuwzwD6uHNzvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GBgCyxt4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LhWgsnW3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GBgCyxt4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LhWgsnW3"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61GH4S7b985268
	for <phone-devel@vger.kernel.org>; Tue, 17 Feb 2026 07:37:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=14xXQ/3V6vn6vL7UT0TVLL11
	sJ9Z3fyzvo9w13BRJcQ=; b=GBgCyxt4tvgxH2I2F/I6tQMRXhKPo3lYFvErgj8P
	fzylBQRHWsYUuUy8EUKDYrZdnq4wWkCeHlmBqmFU/BxZMLYiRs3J5ngCZHF5H3mi
	Z2uixyxRFsHCnoKxRIVz1oQWp4vBaH1P5Kv8n0e4uxSZ9Eqx/AUWbOwlJRnFDf+G
	BSWpzOvBVCsMUEM66LDpJKtRtTQpNncUcmyguycUMaATGicSHLYfSC1fTLxNPXT3
	52DcoXNW4h4u3u+eKzZExILZOMu58JFNVGGf6VNqX/YKy7q5oL1lu0KjjDTVL+oy
	O4TVvoy1aY282ahicQlH74W4tzlT4eAd+uCJdgu6hdVlYg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cc7ap1dkf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Tue, 17 Feb 2026 07:37:54 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb3fae6f60so2613548785a.1
        for <phone-devel@vger.kernel.org>; Mon, 16 Feb 2026 23:37:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771313873; x=1771918673; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=14xXQ/3V6vn6vL7UT0TVLL11sJ9Z3fyzvo9w13BRJcQ=;
        b=LhWgsnW3QDbe+YCfFcl2FqEaIXt1pQfhY7bR6064VABmrLaDdxHpS+hh+Wjmt1KZVZ
         GWpR3ztmfBApqATZQzaIfm87+8sI4Xi8NlHEgZc50n0AHOfLBkZugQdRkg8aOGoEms35
         MD6vUMAae9/hTRPJ53cWFxtW6aVFH+1wJdqDTH/i+3I5zkAH0AIrhXDOXiapf6Ij8Tlq
         zOmq2hAXthuzDTwOcE1VNNIjUglB8t59M+TKwaO2xx5I9q4Kd74Qy2k/fkOF7FWXLZWj
         W4K16Zs2vbpbBLUKu/XuX+su7UbX1VnV2hNPgdVTk2vR8Mw+mF7gsg5jZ+NipuWJvULj
         K1Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771313873; x=1771918673;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=14xXQ/3V6vn6vL7UT0TVLL11sJ9Z3fyzvo9w13BRJcQ=;
        b=dC0w335jubpXXZjgTy8r7FUECd9fZVvQSilKZjryUi50prunWdjWtsU03gS7wFCQkI
         tU0U1lxOvpQgTlED3hEGK0ctekIZVTAU8VKIDacAOCEa3tQbuzpMJzGoeavjDPONknS6
         W1BkY72+y2j7D8qf1IaJCFs3I5Fl4txR5ui2Ym2/xMyd4ZHT1s5eSf5U5BDLzVtVNAf3
         S7ts3K54dCLNBCagD9XhZw2nu79gWiV8Q7Q7+Q53IOgSUzrRqXUfYvV3dFp0nqJRfVDK
         1g0lW45sKx3Yclz7ZV0fFuXPup4X9ievo1XPZm4MiXSEWYs/Tw9xiBLh7lzM/8/i7/5R
         FH9w==
X-Forwarded-Encrypted: i=1; AJvYcCVomYlrC6Ybv46cgR3ra7N7LLZaqF/aifJHjn2/TxL8g/9+tny8AxDWjkFdNgb0ZIEdYazzGGMzVvWtyg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxDlA2rW9Hn0D5sjoFWWvKmFbK1YwiXJ3qCo5/HrOMLzY7ksjzW
	ATdcWG0t38UgxnAcb8r491xgbrbrMB1hwNzKf66nU1lr70VbW1fxKxRKMqNSnV7JTafdr9hPbuN
	/nLdbiyWQJxiDAWjn+0qht+yhLBEcEyk5u/Ac8eYjbSwicR19l7HjznavWidJum0GYg==
X-Gm-Gg: AZuq6aInl0hXPS8pAVtPhm0gC4PuKDROVBtdUtUyuf2IzNeMHitMlw2EP0vZw8NUj1v
	WVpvsH3kE7h2Ve+nPGkVOm4RMYoCOrXTT8EUF6/g/Gq/K0+6kFsaf3BzsbF89m4nEcxi/9PPCOQ
	TkfgTdqghkoNxy+2OfFGJqjdE9ZCf9OJ3raHoc4aUH5wxmORuDJsp44T3abG/2vyh1S7DZ/5lYv
	I3DVBIO7LaJQql1XABploeoiqKrW6GNlNK9pJfe7jK/pxTz06GZkdZ1xMcvVbNLpYjNCDNIwDGt
	zZa2dUeOKdGPOqT8L27A7tRXha55+jdkwHLadYe0VXbB7QCpunyjULxDMOzCJk+bk7giNcwAuiS
	lx9EBD89ihGNdmTzBYebZVBY6i7fuY3OHqNcKIQkyVSQBUubLWeTOnCcM2dh51gYqXVg7EMJkyf
	tvGa72y+jeUhj2QfMwOHjswVHz11dRHO5bxm8=
X-Received: by 2002:a05:620a:4591:b0:8b2:e17a:17e3 with SMTP id af79cd13be357-8cb4abd4053mr1225250985a.1.1771313873603;
        Mon, 16 Feb 2026 23:37:53 -0800 (PST)
X-Received: by 2002:a05:620a:4591:b0:8b2:e17a:17e3 with SMTP id af79cd13be357-8cb4abd4053mr1225248485a.1.1771313873165;
        Mon, 16 Feb 2026 23:37:53 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-387069259c1sm35151071fa.41.2026.02.16.23.37.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 23:37:51 -0800 (PST)
Date: Tue, 17 Feb 2026 09:37:50 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Val Packett <val@packett.cool>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/6] arm64: dts: qcom: sm6125: Add missing MDSS core reset
Message-ID: <mxjyobqlpaxhlnbjoef2v774hbim6hlfrc4t4z7noactacp4if@zpjl24dgtxpo>
References: <20260216233600.13098-2-val@packett.cool>
 <20260216233600.13098-8-val@packett.cool>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260216233600.13098-8-val@packett.cool>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDA2MiBTYWx0ZWRfX3YjNwfnqSs+B
 ylA48mnQcfR4JMNs7xYTpdz9tSMyOGXv31hdiJZWCzW6r+h6QnB+Sye2xOP2Ubje4JGyiSjjZlm
 BDiQWdxIEIn00hLRPivoncuv5wjsH7lmIz4D8Xim1xN4v4sSi1gBsUZ2b82igkp7u2T3MstOWaw
 izNWhx9Z6TDAnk/2SC2exCrAz3Ij/lFMh5Y/DJEhB1KUk5JSItjU8DzY063//aNzQFeX/NfnbEL
 A6bGsZv3bDDsJy1c+raqtKZ9qmpRmgddjYy19XYxpOX1rP+GhN+czkUll6mzXVDF7wtvPW5gBTd
 9hbVuAZGTKSEFnTpNHKgDjFXfTFqCHI5BundBFBnYKyWNnkwoa/o/X+42Ohz/ndjsOVUokEUbB8
 w5Pizy8xehNrXeWBDmgc8hqOwkiunt/8Irb+RktVVHbZeWlLbQ9IjOgkvOz3RSDDvZ9L7W1FQ/+
 NrkLQ4PunX2bmtTjpEw==
X-Proofpoint-ORIG-GUID: DxQCOc7x7z6YJX3INAjXcjd5kBOXWHm2
X-Proofpoint-GUID: DxQCOc7x7z6YJX3INAjXcjd5kBOXWHm2
X-Authority-Analysis: v=2.4 cv=Rfydyltv c=1 sm=1 tr=0 ts=69941ad2 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=xTuMNDBKoo2s9YD98OgA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_01,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 clxscore=1015 phishscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602170062

On Mon, Feb 16, 2026 at 08:25:24PM -0300, Val Packett wrote:
> To make sure the display subsystem starts in a predictable state, we
> need to reset it. On closely related SoC (sm6115) this has caused
> DSI displays to not work.
> 
> Wire up the reset to fix.
> 
> Fixes: 0865d23a0226 ("arm64: dts: qcom: sm6125: Add display hardware nodes")
> Signed-off-by: Val Packett <val@packett.cool>
> ---
>  arch/arm64/boot/dts/qcom/sm6125.dtsi | 3 +++
>  1 file changed, 3 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
