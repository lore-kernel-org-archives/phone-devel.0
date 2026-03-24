Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 923E335295C
	for <phone-devel@vger.kernel.org>; Tue, 24 Mar 2026 20:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774385922; cv=none; b=AeTgVlbs/E7QnTCm3oFvVBNit3PufEDyXkks9/SbtzvD/LGB6vkmJvVualdEfkns2paMbZBynirsqZogkeo8L8xphJZ4oMbeNjNGcz6bZsaTR95MWVIygbRiKW+Mjd5FcD3YiYUj1Bq+/OyWs77DCUsCov4PCDHrIIhayfu1N7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774385922; c=relaxed/simple;
	bh=1iWxZYMdT7WZki3cVU/4IqF0Xz4RsVOvzqZA6BYw0dE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TBanSehfYt6kEjwhSeNSEXtw8P0+yP/vg6NoeAL9ZcbBChK8HeKHT+hXB/YdLo3hejbRGvAnaYDm3XEP+po9YLxL60G85wt6+5ivAJVmhby8WFpw9EmM5FV9APF98eJkgj/wmhgfvk30oDEHTlRSK//ZKG+E9h122GhcwRZQ1VE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AcNIreDC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B33kGQwq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AcNIreDC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B33kGQwq"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62OJOdw71862801
	for <phone-devel@vger.kernel.org>; Tue, 24 Mar 2026 20:58:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=dObdCUPKJb2zp1nx9CXg4NlS
	qmz3OxTlGvy/tRkBBn4=; b=AcNIreDCN0pEvFBQgTEgj+QyXg/iL5U4cPVlj69p
	GwuYBhRy7yGuofsG/8HE4YfcUWWW8hoHay27nUR6v32GtDOoVsHUrUaUZoiwfVmF
	vcz9OUUy09gPf+N1/o2bglx2v88Ui02am2ZYPGsjSSz1Rtcu2IkQgpY7tEdPGrUp
	m0FNZBixfTaDlwKBXDQGqOjSMkfQcdqwgY2P2iEy96hIf/RB1rTPDWmKKFjalWyy
	hyTtp79RTEQLsMOSilLHrfOm1/7X4BGETtW2BdWmjPni7GMs0iq6zfiDVMkIqUzB
	NwPOkOGxh0TmkTehz4poUINP7zjeoeC8Fx9yVvsoQDdpJQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d40rar87v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Tue, 24 Mar 2026 20:58:40 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b3544bc7bso15908461cf.2
        for <phone-devel@vger.kernel.org>; Tue, 24 Mar 2026 13:58:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774385920; x=1774990720; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dObdCUPKJb2zp1nx9CXg4NlSqmz3OxTlGvy/tRkBBn4=;
        b=B33kGQwqen8rtsWLhbUAmFVDcVrPxmV2A+j8rzL3ire20lYWzhsWVhqGu3TleoVPdS
         0BW1+gSBfY8j+weSpTvArlCDQlIIkHgRZnX50gRXvr0fkDalQKSx0qQ4hC4UFzacPDzg
         oc/PCQi1VycEtPWIcvlIOW2gJiKnQ3ZPAlrA3K6SEHZqbbjeOJfqjK/bQgSADYfMmo3t
         K8U2RvjsyZ2EwiVJGkYnZVYPxm9ATRgHg1xdQzi8NwsHzaJ89ANMQJmyujMcPOD6K38b
         1J3UlrQc+H/dpiEDsZ/sw9OTCPPoh6z14IlTwMNlht8RdafiSe/cQUeZMf3nm2IjGaOT
         torA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774385920; x=1774990720;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dObdCUPKJb2zp1nx9CXg4NlSqmz3OxTlGvy/tRkBBn4=;
        b=UQBy1VUCAH5LmfEaBmH7zDH/OBWcnacq13OhYWcN/iXgEQllL52rQs3q4obKHEOX/7
         ABKaE4ZFteyPqp7t2GCQlHOm1ZAerqWcphbWZt/u2/zbLwE2J7uZb+Dsgw4+px/0GrX+
         /rhYDKpCbe9ndjHC95Ax4gKTPP8n8pb1e+u6OJeafm49f8D3Z2iZ6puYzzhAAI8lVhC0
         8LrxwCs48Lm95mXydqpk1Baew8kLwJNiiPdbXBzXyS1Mx/eu89K2+BVY9bqGSP61aT+T
         9chgncYxrpcoVdXIIdmREGyeJV9h0nv0qRffKR4y+D6BGMIid/63zHHthXoM3eEn9qH/
         8zsA==
X-Forwarded-Encrypted: i=1; AJvYcCWm9AxHonr4x2uNlElXVhDWOhv63BjEM/kWjzyF1aV+C5JsTM0m1QRE72FB7smZSJWj0S2zBeX8Yupl6w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2BE8c/hnEH66Nr46hTcseKcdu7qg5+9t4B7gA5DhPhFvK+33u
	/gYisK9dMdLwkGHg8a878KZi9dwWop6u3ujaraAmevQ6QEEWcjm2fVuRMGvlABO26fcddzNjwUA
	viRDm1Wh87wjGWMTnqNu0p0N+4IO4JJgUm+xndojnD9nnULgr7Is7zneDrLLHLXGzmQ==
X-Gm-Gg: ATEYQzwYidF97NcGgYKlQ3/o/yvAp2ylmucXBrod9WnOZOI3LJ9F40C0jur0+9mxe7A
	hEd0ZCiOi5tuk3VH4kRTrj2oJ/qHY9+opQw8hCNGAj8ld8r94NIIFVy4mpFFBEMHP4+IF10SaV1
	J/d2O6JtCGLgTs1fRKHKKiRqRj1aiQ74CW+AIeXzsvqVC9Dn/YhLv60V3LRIIzRYTwVbjyWPnyT
	wKMedK9LBBmXW20BbBbBqr8ewnqQWrqJ/Lp6uu/TUmlt083OA38D3NlAdUPzlk+BMi50G5STqF/
	X5y8pPZVqPLqzkOlfUfS297fLPuEYdnbYjMEfaWxb5XwD18m4Ta50pdAnlyu8/L6yjutYwj2sKk
	waKiEiUR24b/e/hB7aKiSXGAdxYc9i/NxUmDSseBVxBSSmF8JNOxi3cl/J0n504fSaVjO1nBVj4
	XiTQAsWpJI44KG5aoUKtLKX9dwsUhLMrG/EKQ=
X-Received: by 2002:a05:622a:607:b0:50b:49b2:7bf with SMTP id d75a77b69052e-50b80cac0e9mr18078691cf.12.1774385919745;
        Tue, 24 Mar 2026 13:58:39 -0700 (PDT)
X-Received: by 2002:a05:622a:607:b0:50b:49b2:7bf with SMTP id d75a77b69052e-50b80cac0e9mr18078231cf.12.1774385919201;
        Tue, 24 Mar 2026 13:58:39 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38bf9ae8570sm32544541fa.42.2026.03.24.13.58.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 13:58:38 -0700 (PDT)
Date: Tue, 24 Mar 2026 22:58:36 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Paul Sajna <sajattack@postmarketos.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Amir Dahan <system64fumo@tuta.io>,
        Christopher Brown <crispybrown@gmail.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v6 08/15] arm64: dts: qcom: sdm845-lg-judyln: Add display
 panel
Message-ID: <zcysysph3ouvxmfusit6jakrebxc2me2gcs7ltgypejmgv2axt@hm7ayaaqmsvt>
References: <20260323-judyln-dts-v6-0-29d70ca1651c@postmarketos.org>
 <20260323-judyln-dts-v6-8-29d70ca1651c@postmarketos.org>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260323-judyln-dts-v6-8-29d70ca1651c@postmarketos.org>
X-Authority-Analysis: v=2.4 cv=Jvr8bc4C c=1 sm=1 tr=0 ts=69c2fb00 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=Gbw9aFdXAAAA:8 a=CIaC5ZaqQcpxzUOrIL0A:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=9vIz8raoGPyDa4jBFAYH:22
X-Proofpoint-ORIG-GUID: bvy_DSIXop_2ZERDtlC5CxwyLbBLl00c
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDE2MiBTYWx0ZWRfX4tR6kzY6bGzj
 U0JZsVOSzHbR/o01ogZ2nTn9+b2Pe/t1zSgU7QH+ZuI5x/IHfEV41U+YdSAuI9GTXPXOpI3HQ7n
 b7lm1GFuvFUAC0Jyikt5esv2kboKrjZjWHu/TO6KgOR/Q5Qk8v4H2sQU4mB4v/Vpxizy/fCZ90Q
 wRxLjhfBsAmFVJDr2WudNu+xX1sXu73ieqb9PiRI3/6lhVoq2NxWamBwPULn1r8coG8ZxqUjPvO
 plHAzNKb/pSzpmrIXfk5RkUQPzI3MVWJ0rWgbc0sEEH+6vBdOfTL9aa3nXHaDbpD7Cn/4hIlb1m
 brD4htjWU4oL3QNLONBhexGOF7rzWw1ZgvSlu5/w+3BFONsiW/24lAZryX45iSffUVk8Tkpqs/I
 ZRMQGfsUKfhu3dABxNPYXYP3ziR9wMxQT56erc35jIi5mO3sm6/DYmoSNIm5LM4aU57me9Im0sw
 kw2BSs8nNGbCLlRcFvw==
X-Proofpoint-GUID: bvy_DSIXop_2ZERDtlC5CxwyLbBLl00c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_03,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 spamscore=0 clxscore=1015 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240162

On Mon, Mar 23, 2026 at 07:06:38PM -0700, Paul Sajna wrote:
> Also include other supporting msm drm nodes, gpio and backlight
> 
> Co-developed-by: Amir Dahan <system64fumo@tuta.io>
> Signed-off-by: Amir Dahan <system64fumo@tuta.io>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi | 13 +++--
>  arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts  | 68 +++++++++++++++++++++++++-
>  2 files changed, 75 insertions(+), 6 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
