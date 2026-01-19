Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B5AE309EF2
	for <phone-devel@vger.kernel.org>; Mon, 19 Jan 2026 12:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768824922; cv=none; b=eanTCXY4afom54iGBQYus6H4h7lgxX/NDPAjiBrY7Esdz44fFiD2WqrJYUXpMYkyhLSovzvSM6Fo12OBKu6X2KDkDLr5AIL4hvkNScSNRXbgvKDjfHfDPfqnrnRwDPj4iactOFMY7eAh8PG0nGioAP76TPM1d7exLpM3LBnvIGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768824922; c=relaxed/simple;
	bh=HkdPCCSHrlCBEf6K0eRLEeE5DxaLMw+XUXxKwdvl79U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TwpTcTOco/6cimJsrrX1WpNFkjgTweG7rAlKHW1b6A7xMfeD+VoY77MiIhGPsE93oZocUm/5S9OcGR1RPbqr+GHNPkE1+KnlK3wgx59XiIozoOIBzpj4cjRP2RkjARj4DbpWuHZHlwgvLx9nRa0LcNBqopHzmxdYIZSVovroKtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gJjdVkzt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Kh7g4VVW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gJjdVkzt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Kh7g4VVW"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60J90h0M227848
	for <phone-devel@vger.kernel.org>; Mon, 19 Jan 2026 12:15:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=c5pE1RlHEeT/iyjqk/IGza3C
	aPTZcIOlCDbIoUUgpQA=; b=gJjdVkztOHaaqLyq872u8Ov8rIXL1CPBe3uJ/3IR
	IWnKR+uMOUdc/HPFtKpPefKVicOLNcNlIfIJROtDrmS9ET1eBFx6muHibwsGlWek
	h5KarwW75g725fcFVgF3EK+3VN4jLSMFIvXxQKTA5clfbKJzgNA+DGlWHRMxdl+T
	OLN2G9Srj3pPva73Ab9wCXxisMMu2JeNUA9EeKhACnfTWX5kp0wvYVp8mUrM6Rdb
	X8h46V3GV4ISoJT2Qvz6BlqijWEaUBz/29VbtEVZNaRSDhYFtel4YwCX5N0T6ugI
	lf1liDOmq5b0j9g8WJ9yQVZT/8QEqRLwYYZKgnn2QF8COQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bsgfr8vnu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Mon, 19 Jan 2026 12:15:20 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-88a316ddbacso102901836d6.2
        for <phone-devel@vger.kernel.org>; Mon, 19 Jan 2026 04:15:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768824919; x=1769429719; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=c5pE1RlHEeT/iyjqk/IGza3CaPTZcIOlCDbIoUUgpQA=;
        b=Kh7g4VVWs7TK5AO4tt2vGj3wpL3aq245ZTUndOXwBydYspICN1+tzxw8zGb+S7w9Mx
         AkH+oW52FP0gFuAfF+q43IXk6C9mqYqaKvIbmpZPFsoK4GDNDYhe4qWh7Mdz5F4KXOPk
         a02SL6qZRYgW7sOm3L0FHa6cMByvBEwXKTGoVBUd/xq5nbB9B9ihsRHPqv4Cdys3lkua
         o9KoUAf8wpbE3B+ekFNIMf9YcjAJokGT95rAh/uWQF0TmGsKuyBZDbxVh9IOWBMeU+hU
         RybkeWJoCDZ61QIO0uqCrCZwBKSXsu6+lO/CiHC0QRYlKkjGNoIocONr2HmEgaunstkA
         xkGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768824919; x=1769429719;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c5pE1RlHEeT/iyjqk/IGza3CaPTZcIOlCDbIoUUgpQA=;
        b=bjWgFMV08YCpCCXZVrgpC+XUrD0whzAtA7MYsOWaJS4kfCgqvJ9kjI71Mgfs8ciOdP
         gFU0EGC3++C5urvOsREULtn1uLW6uqF0vcpL9WjCGqaOzLQ4noMpYJdYmIh1fOS868Wc
         RygaTNxyGjm5uBxYFxs2Iy9axRBWmVFrHtLn0nkJEB70jvPKDavXBPWFdBhT5GrsZkXw
         zFfZ0kdbl9MY5UKt3DikuMaQ1Oi86v2o0+y9QDOmvNCoQbRl6O9D5ZYUYGCYe6M3ztOA
         ywZy1f6fY4NIfiur2tFDLPo9eSgBH2XVoo+KxVQnz/ZQwOZLxqs8OWbhwHXBuxhdzcs+
         tvTQ==
X-Forwarded-Encrypted: i=1; AJvYcCXCd+eK13aHHAk5Lh/qinyINBaggqvHR2hLWnRhX076vN/d3Sh/L/UD78rrZIwQYm7iUG/2kt4fl/koFQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyBH+m6RkWYFwrJ7JSbh4iq7Yevfks0l2+71n/aojp5zhVBCRse
	25pCKL6m0ESXuH4IQ6cb4JnS9/td+rT8BU4IVfCDS46oq6ccrBpKstTx+M2Zk2R+BoJtlyZ1qnH
	nKAjmyNLZ6BfC4JilLqhWZQknDug0y4AEet7veLovmP1jH4Sdmqg11O/fFVeGZ8BwLxTjoqsl+D
	Fg
X-Gm-Gg: AY/fxX7tY2jS2IGnXoKyQrHH96R65krqnSfunmSTVReNjKdwCNNDWqWVCHObMUNtnVV
	QhfzIpsuRAwiJjxKHG0w1q1zQbXl8RGsLrAKx3/IwHRfD3JRRGaxqskfntMtQyAkk+j2cszXngk
	HA78euurYSNdOuMnl/3nUFGBrFde23vn6dZe1tn2cHPVkrIgXX///ekuln9IND7MiKJQh2cfgvQ
	BZKVdgqeVZVm/aoIs/tcJn9UlENBwysbWk2vJhs5HxAc5XTv8HsKc5KockLlKwlkvdRG0nvUPT+
	2tSaQuVBWX9NYhyQYHHhFHpLWrEVBeT+vfM3qstlFQoKznFB9xeggoc2erc3hFy+u1DHev1LyFC
	N5IaU++5XFOyieiFN0FpHlbW/fBNpeFDawpcSxDzimJ94+mPIg/n5kHnSvmbapZB6TasGQQ4PN5
	iDEI11Z6WSN1vCm38BeooewtY=
X-Received: by 2002:a05:620a:28c3:b0:828:aff4:3c03 with SMTP id af79cd13be357-8c6a6789392mr1415541485a.61.1768824918872;
        Mon, 19 Jan 2026 04:15:18 -0800 (PST)
X-Received: by 2002:a05:620a:28c3:b0:828:aff4:3c03 with SMTP id af79cd13be357-8c6a6789392mr1415536985a.61.1768824918326;
        Mon, 19 Jan 2026 04:15:18 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38384f86157sm31705851fa.36.2026.01.19.04.15.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 04:15:17 -0800 (PST)
Date: Mon, 19 Jan 2026 14:15:15 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: petr.hodina@protonmail.com
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sdm845-sony-xperia-tama: Add
 bluetooth
Message-ID: <x2scqtrj6sfvlotkossqlxokubuoeuycssxkkqm7ncuei46c4s@hplpveln4vqj>
References: <20260119-akatsuki-uart-v1-0-238f4da4fa56@protonmail.com>
 <20260119-akatsuki-uart-v1-2-238f4da4fa56@protonmail.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260119-akatsuki-uart-v1-2-238f4da4fa56@protonmail.com>
X-Proofpoint-ORIG-GUID: DjjsM4gxR70XJzPlPSOkJ-yj8i2827aJ
X-Proofpoint-GUID: DjjsM4gxR70XJzPlPSOkJ-yj8i2827aJ
X-Authority-Analysis: v=2.4 cv=c4OmgB9l c=1 sm=1 tr=0 ts=696e2058 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=sfOm8-O8AAAA:8 a=EUspDBNiAAAA:8 a=kVCuoV9HowMxSFpO-lAA:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=TvTJqdcANYtsRzA46cdi:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDEwMSBTYWx0ZWRfX+03nOT3BIHwX
 Bj6DHviSMQtw7lcxXjLM6kmXS9DVg8E10E63Slre4zf3RMzA1v8cuElgDZIQf1JJ5GK3W9daL7p
 YL7/pyfkB6fFpmn1QpV+Jy4QsKafXeGchx+JOZHyihoBHliAhyKIgPkb9WZ03pknXnqHP1vYvCN
 rUlWjT6gbeTFRyPK1jEwy0664urGmISPoIBjy6LWsazS5sTREKpIkaPfUbJySgwwvjJnO+jVrKd
 mTo62G99pEeLFlWvKMMUl6cgJEX755EKSgPnXsawpS4u/nkGnuRK3aBiNM3g+esC/K5aR7Ioljr
 SEep7w/aTEr7Vk2BW13NBUhH+Fx9PdoOS8rk6e1TKQy+EJRcEhTlOdnFsQi0WRO4p1mIxYvTxUT
 RNq/B5GRBun3u8YJ95ubFEPXFDNoyh5dQO6ltglC1WRgZYRtZjtPcVEzG/ec+XBRX2IbeWFLMiV
 eue76fDYUoagHupN0zQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_02,2026-01-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 spamscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601190101

On Mon, Jan 19, 2026 at 12:58:53PM +0100, Petr Hodina via B4 Relay wrote:
> From: Petr Hodina <petr.hodina@protonmail.com>
> 
> Enable the bluetooth interface on the uart6
> 
> Signed-off-by: Petr Hodina <petr.hodina@protonmail.com>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
