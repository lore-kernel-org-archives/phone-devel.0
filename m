Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFB2C33A701
	for <phone-devel@vger.kernel.org>; Fri,  3 Apr 2026 21:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775253466; cv=none; b=UKPQBne8dI/C/b8We0/mBMuthcnSzYDEJJTLm75eGvq9g4eDq59p/KuvsXOvZsm0fuyFrTCt4j4yGO8MZxPz5kok0ROVArAvEj04fZr6wAksZ2fg7GQtDkcivbwIbpQlHGaIuIkvI8hVwbHZ4F2JNkF6ihJ8QEV7zqxXKhV0uog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775253466; c=relaxed/simple;
	bh=DWUQGfY+cMmSq5aGAa4CP2kn/TKjl6cto19/qpaK/dI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NaUWl+L26UpzX05noYT0c10MwHWpU3QuOb/LG5zEwU2WMBrHbJE9qyLe8I2u6N+mibHzbRhWCZsm/2geLJVANFykLabfv1oGaFCJGN3nOoQmUwqH1zQBAsUQtyqkFTYhB1e+R0ZfmHNn7XvHhT7OfCpnSRhmppkXdLnF71wtiEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e25j4y5y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JKPWr358; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e25j4y5y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JKPWr358"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 633JldS4917582
	for <phone-devel@vger.kernel.org>; Fri, 3 Apr 2026 21:57:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Jdw4BMkuoysn1cjVxg2If+mk
	C6tX7NFjU3rzvor305s=; b=e25j4y5yP2KtCztyw/34lb/jeqSPu0VPVKkb1yw/
	eGc47dXqRUJhfbbse9rovqfxXHsQY2uCD13SxC5W/aV6oyoA0DfXw+3HphsXOah4
	TSaNj6/F5J5ydKOIxzldsnFM1zGmUYOpIUS0R7UDe2dzDaWr1n5swUuGTA6pNsUd
	6IEfE/LeeupyArgL2/nHxREhLPD3C/NTxeL88+qgq+R4WuGdbT+yasUugHNgTrBf
	KU6W7wg0Ve2LdpvWvU1XRtLEhOEqie0MeIFW0Ulo9m6nLcnSkadNbZfLTruaRO8S
	rSN264jMK0jsOJ4tlo7XmX2eppaaruQjKKCSdcsqHIP9Dg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dam160964-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Fri, 03 Apr 2026 21:57:44 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50917996cfaso73959861cf.0
        for <phone-devel@vger.kernel.org>; Fri, 03 Apr 2026 14:57:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775253463; x=1775858263; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Jdw4BMkuoysn1cjVxg2If+mkC6tX7NFjU3rzvor305s=;
        b=JKPWr3589yuAycLWOiIK/AerTi3g2PGzg4JO/N4CNWxzmqXH/Oqa+MfWUiMia1urzI
         XoL2L6uB9vLIkIuA6hR2krBnJvfO9PHhR7/t7KcSy5KgfoWGQmdG4455iHjtRd3s/58e
         K2juRQtMIVmp68GNie2JvwT83bDDdauhYE+DKnByxpcFfu38onud+wIliDtFoz0A89wf
         1goHh6mo3tyf3OYJ3ph9xY4DLsLiJtgmsnEn+rKHtq1SgP1iAnl9R/sLCqapQEqblHif
         tUw4dazBp1PAryX0CvwcpkdqA/7a3fbAgfUD6C4ZXPv9n1qUt/PeyOmubOtmaRV0edvL
         YObQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775253463; x=1775858263;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jdw4BMkuoysn1cjVxg2If+mkC6tX7NFjU3rzvor305s=;
        b=X4kilBMmZK217LZM/k+fXqhSn2eXwNvtQrSQLhzI7/27+W1LapDl0zE8VYv9P4WmiN
         RuDziJteG64a2k6T4t+O2c6Ih752ZGQAC29pKwav9dMF/0m+2ookn0RP8JPCr3EgsCWB
         yl5VVAg3bRgqxI6Th5Fs72LDd0x9ovFKuc6b3gQYFQaweIjienoZCu8aRFNSTO/0yrXa
         YkfgrR6sx+ka17EyBllDznE9waKVIcGkVc3ty6ty4MP1JoGukpu79Cd3uV6BgGrR6+aC
         WMj0ZCoBInQVLcADlUnGdsAadc693Qn9txavdTmwKAi0USUaN89vb0YoJsEBsWQbAePZ
         ZWWQ==
X-Forwarded-Encrypted: i=1; AJvYcCV121bFAuc4UC1GfJOxzdOAX0jL7yLJ3s95msVurfcdMHtl+CB8AFrGXm0Z9Zhl+eR1rrAu31qKxL1nuQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YynLXMrJO28IMNqqCrpRvScxLBbNDzxVKBwk6glwEcUE72Do5/o
	0VRoQAIxR9RJzHGWnnN7x7DC4o1fy/nP8zqx/RG69MZLN+rxghujtTc7fvRkGrffmNmcQ9ibH1s
	aiUfuutk77/VRUOslBZ2KL//F0iGlq6d5f3NGrHuNicJ1lYfHICmPX/K7+LcbR9IAvw==
X-Gm-Gg: ATEYQzx4rZjq8bk033KA78Zo2lStrZlRLu+yRx5wa9ettDGQXv18AGwAegNtCFcCJ2q
	11Mtb66JU5fBp0o/eFqQbl0LAIVKUtNF9Qt9y2zMEbJ3YchNd8l7SRblQUbUVGl9RMxmP3PSsLG
	Wfc+x3ezct7IA0N4NUl/1kvgH4WxU5KWaX+h4oKJ0MHYWgLx6yDne4bx8CQdOsmYW5hW7+JhGAZ
	9HSyIMyJ/zQ46SAIJSGegNL3uTDmxubcd0JLic/erW8FZxBIZ9GzKsbys8p+rVO5/29tJodGKcf
	lMMz9heK3cLJ5YQ3642GLcpWeF94twykxY/JiIRKEDE9jX9BPw4En568r+u0/f+SV92ARKg8KBT
	3PYn+8V/yvxY7V0Ovc2fgxG8g6SehXBAMl+xbi+LYGS8dZEbdfKeld5Mlvq0vGVP2Eecyfmsrf7
	JwUE3vWqD13vpGYIfiX4I50gO2aiYGwp+Ie+c=
X-Received: by 2002:a05:622a:5810:b0:50d:5d96:568a with SMTP id d75a77b69052e-50d629be2ddmr70828611cf.27.1775253463254;
        Fri, 03 Apr 2026 14:57:43 -0700 (PDT)
X-Received: by 2002:a05:622a:5810:b0:50d:5d96:568a with SMTP id d75a77b69052e-50d629be2ddmr70828281cf.27.1775253462713;
        Fri, 03 Apr 2026 14:57:42 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c6cccbecsm1677937e87.62.2026.04.03.14.57.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 14:57:41 -0700 (PDT)
Date: Sat, 4 Apr 2026 00:57:39 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Antony Kurniawan Soemardi <linux@smankusors.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jonathan Cameron <jic23@kernel.org>,
        David Lechner <dlechner@baylibre.com>,
        Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>,
        Andy Shevchenko <andy@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-iio@vger.kernel.org, phone-devel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] iio: adc: qcom-pm8xxx-xoadc: add support for
 reading channel labels
Message-ID: <ahm3fz6j6kbmqe3p4c5e4szkbhcihtgxaj2z6k46kiiit3qrik@wvmbg4dt4l36>
References: <20260403-pm8xxx-xoadc-label-v2-0-29b50bf821e6@smankusors.com>
 <20260403-pm8xxx-xoadc-label-v2-3-29b50bf821e6@smankusors.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260403-pm8xxx-xoadc-label-v2-3-29b50bf821e6@smankusors.com>
X-Authority-Analysis: v=2.4 cv=Kr5AGGWN c=1 sm=1 tr=0 ts=69d037d8 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=wxLWbCv9AAAA:8
 a=EUspDBNiAAAA:8 a=I-nygmCkc1d6-4TqzFwA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=QJY96suAAestDpCc5Gi9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAzMDE5NiBTYWx0ZWRfX0BkfOzQbm5iS
 5jWKhCsLrDePqfrXDKTcvpt9iW6k7ybznDO5+yxennbHa5FsfxGacxE1uL2JvAAcIPDDu4uiGwW
 BUKLfo5a/DpAjeHMTyMPJqw7lNu/UbiYoK1AFoMIgz4NyDEjlEI0voIP82qjp55QUb0hXYsQAcl
 8R6fb5AJwOyRRCHNVKYw5d/uUtOcCBfxyx3kRltcgZ7UvB9wjhdgOUUKLArWNJBxPnuJ7BH6aRo
 Q8uKKX8a0+awLkzTzKIf7uNpjlw6Sw87zMCYAwOkNr35QH9EcW3Zw2CzEapZv8ShlHa1ihZE7oD
 ejzOw1pyTN2IHCY8TQ2nFDy9pvd0Snj3VriRvZGIp/lXaSqZExGiQEyIWVUGXFGnKsl2tnsi6Xd
 WDHdgQgjjILiKt2oA2aaAQpXQeb2cA82U7YTfqLV5ltPNm1aVKMR//IRn8S9nFcz3uXaYV4wzPq
 LSTGa1vG/VKriPZUiFA==
X-Proofpoint-GUID: _IwZXoNI_SIPD789ujxbaqgrE_l2r7zO
X-Proofpoint-ORIG-GUID: _IwZXoNI_SIPD789ujxbaqgrE_l2r7zO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-03_06,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 clxscore=1015 adultscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604030196

On Fri, Apr 03, 2026 at 09:23:21AM +0000, Antony Kurniawan Soemardi wrote:
> Implement the .read_label callback to allow userspace to identify ADC
> channels via the "label" property in the device tree. The name field in
> pm8xxx_chan_info is renamed to label to better reflect its purpose. If
> no label is provided in the device tree, it defaults to the hardware
> datasheet name.
> 
> The change has been tested on Sony Xperia SP (PM8921).
> 
> Signed-off-by: Antony Kurniawan Soemardi <linux@smankusors.com>
> ---
>  drivers/iio/adc/qcom-pm8xxx-xoadc.c | 24 +++++++++++++++++++-----
>  1 file changed, 19 insertions(+), 5 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
