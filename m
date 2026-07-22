Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8020728850E
	for <phone-devel@vger.kernel.org>; Wed, 22 Jul 2026 13:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784726661; cv=none; b=ZHtEtIS9wQ4P2mfT6IrI2K6YylJ/yUVRO7OuHqq8oPJlskp4PZO/1jxiACfkt2rbuz4Bw0W4IyN8gQ//ZFEpkv+7aWVRVF7B0meF7w4cEoHq8fjxp3YdhvFaSH+VIZ7S8oAT7/2Cl048qASRI8SMKVCc4pz3Ex3WFS9oJKQIF3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784726661; c=relaxed/simple;
	bh=OtuCzfm+Y2UHA5VM0e1dmQovrRINQObfVgzsesKn0hg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r+2W4oeem6x1b847uq/AlbFm+9csBLgeqM3/NXXlQm/Z4QCvBYepOniNCwuJSInoaCfldvm30LEKNdOR+Ww71dJ5XM8LnB9LxYkskCRkF7Xs5Z9XUwqytJ4AMW4J4jIkfy0o8JROoYe7Ojam/qm2palkE5DTRM6j4LiuwIAuWyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DPcEo+xx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DmKsj1fU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DPcEo+xx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DmKsj1fU"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66MD1pYg944745
	for <phone-devel@vger.kernel.org>; Wed, 22 Jul 2026 13:24:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=T8Wl3PkYX0uLbKQSwPdWic3x
	tWSYx5vu6/J67u/+Rn4=; b=DPcEo+xxSPQSvINJRvBLZJXW4pTaq9Loi7Cvs2GM
	OVCgodeU6yt/m4VDJg8CZpb4Q34wiKP65pAobLkNYAzTqVP6kAGYIzLMpRgin5Rz
	/mxRZIJ8/yLqFCsN0yID2+JwHrYMTESHthjoN3GqWtv1CvciXAWbtAZqfbixVMdw
	KZFDAWGOcqwPes6fdG5ldkCoNYCvhs4j5DCO5z5OP0sFWNOOINgCaaRdrdM8IB0V
	8n/tCEJVLyfadK1hI5q/1OmiCG2SEnwL6GT9wVZgrery+nOsrD073eWSNo94rO8J
	+k8BwU52AAu+rNPahein7acRqxwfUBOI7p9tC3Vt/ngRvg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjs929gex-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Wed, 22 Jul 2026 13:24:19 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c1c7f135bso188975481cf.0
        for <phone-devel@vger.kernel.org>; Wed, 22 Jul 2026 06:24:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784726659; x=1785331459; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=T8Wl3PkYX0uLbKQSwPdWic3xtWSYx5vu6/J67u/+Rn4=;
        b=DmKsj1fUnlq8qRlgi9Gc/EvoFCEsjAteaea7suavFko3wYIulSFMJ9oylZ+6UIhMcC
         6mJV3YsIKApBtXu6AeAWZR4RhL1DBpU7TiTaGcaCGxMallOLzi6bjWepJ5b527EU3LSD
         1Ht/rVltBJNVQcbdKDxFXcZHQjbc4S07TnLkiwrpHuz5s06I0UY7cRaEYdvOUBuu2EYn
         DC8KnaCjvZgDd6WIbtZi5Kuo1A+9vYBjYTuaU+ihQ7ggk5/tiBaUjMpWV1+nfO8cu5WR
         5NGSeBKh/VQIjcZgn5GsDGrVSx6L/b4KWNjVqq0dBiS4TTpepvnvrcCeAooM/K7iplXr
         suLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784726659; x=1785331459;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T8Wl3PkYX0uLbKQSwPdWic3xtWSYx5vu6/J67u/+Rn4=;
        b=e2zo5O8xxblgSBDD+mm06kKaiZ08iPEwQN4lSFTHmn/Uh6H+T6M8B3ZA7Lw946OU2Z
         GWl0B8811+1eJSajjG/TPgtOjvIbqW7GjCxqgovl8yytnVNUQku0ruKPR+lVtlkWEJ7d
         SGrpVxtk28cufhERjrAovabIhRkGDZxIWJtxbAXgN0Uip3k/sjnyKlXYfkwlLvAJWNH6
         sSCya6tQSTffZPeGv5TRCby1LxvQDCcA6flIrehbMnUayKr9wOLIJa3YW0Ao/iBWq2cz
         R1DxKh2QxhzdvqNx+4qrGk7l85MwU565KQQmFQmSVjt1Daf2HJ7w4zXh+5lTYGSatwJ0
         h+Rw==
X-Forwarded-Encrypted: i=1; AHgh+RptFpzksK25QmcumXNc74eGvdMk9chvKssNanfMdAWN9mvD/gMQkGmR4J+AhKdMdUbFwovMRc7HMk6h5Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6JajEOc+yC9npQQmLHNEhEpeaD37tymHFDf/UbEvfSwWoHCPN
	eqVaBoG2lXGj0I9WH19YjVnFfHr/WFk0FuERj42/AsEroTXgoToH7hZKIt6yIirmtIw9k+Gf1W0
	wcbP05mf12v1Cn4cN+E+yE1eVJS0IKkHXZYqzJtDvNc/bfR/oJCf+JynSahDa+bt8ug==
X-Gm-Gg: AR+sD12rSyN9Q4NYh4iUX3Tymo8Z6L9OiuIq9LV94LPC5NBvu0bLXl5RWLe06J9T+1j
	zdotR5LZARgG12hAFVaX12G3gfeWNrHwryE/DZmNT/E+Bf2C0kvxafyIKaPN1c7HrdTaOm2zFAq
	YU0R1SZp9z3EkMDJFNW59sVKEKJ2o5nD9dMqQER94PZ/6JqZSTDTQhvkNRxZ8o2VgrfFYy62t4s
	vfS56mhPxHgOxGviBGvOootBw7sasOC2B/A9txnTIZs3K8/MlBNDwiFWAJUuG+hE2vPpjygwP8m
	RpmKEFNvFpYvMX714dkrFNfitEF4YMC7NadJ3/BeC3T+cfHHwP0pj9wWwkGI2gseUsqM2w9P2+4
	aHzLUE/x5hoSIWbQZuOzmB11xjh+JnrnqbI0ThKZVFupKs5TgOHdpbV/BRBRnDqjvfja9fABI98
	MBZYoV8LYFOP9t+A==
X-Received: by 2002:a05:622a:8c6:b0:51a:8c97:fb91 with SMTP id d75a77b69052e-5213fc53b39mr230566221cf.58.1784726658931;
        Wed, 22 Jul 2026 06:24:18 -0700 (PDT)
X-Received: by 2002:a05:622a:8c6:b0:51a:8c97:fb91 with SMTP id d75a77b69052e-5213fc53b39mr230565661cf.58.1784726658456;
        Wed, 22 Jul 2026 06:24:18 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2a9d4353csm457943e87.57.2026.07.22.06.24.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 06:24:17 -0700 (PDT)
Date: Wed, 22 Jul 2026 16:24:15 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: esteuwu@proton.me
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3 2/3] clk: qcom: dispcc-sm8450: Migrate to
 qcom_cc_driver_data
Message-ID: <oehzbfhssp4ky3tptpygc66ebylethh6sla5nunfhluwtznqfi@meykqppu7jwy>
References: <20260713-sm8450-qol-dispcc-v3-0-56fd05822270@proton.me>
 <20260713-sm8450-qol-dispcc-v3-2-56fd05822270@proton.me>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260713-sm8450-qol-dispcc-v3-2-56fd05822270@proton.me>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDEzMCBTYWx0ZWRfXzTBHpwT8u+Rn
 +JXtaqsLOC7gtu7iN+3OE7XmSuP6IkTiwSy7gBvVe/3cRzPbcJQhcHYcuBaXXYW5etKLjZJrSS8
 tnx/+Zeb3M0PfrlvcDAd9b/PSlcGn6I=
X-Proofpoint-ORIG-GUID: jiom2jiiweKMWIXhkxO3sg_PyUJb-s2Y
X-Proofpoint-GUID: jiom2jiiweKMWIXhkxO3sg_PyUJb-s2Y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDEzMCBTYWx0ZWRfX3C5wi50PZesY
 R3C8G6ds5tD+uuCd1xkEvoV38z5uJPdHgx8UZQFbAKn1KBDyQJq2EpYuzH3krcGD7yLRnfcqcJ7
 eiSaID3wAFCMXNIB/JGnIC48raH9JFxviv//FwZb1pPtaNrSNDoJJA06+nsQXuc+R3nj1+xcTNS
 Ni3ghuW2nJoUbuCMFMIgfNnQg7u6LQMpV8x1Sw0fQGq/P88wILvNwcRVeYpDEZ6u962TRah0pOp
 HT02Ninr/NuQM1MXSV4v6sD3rf2kQNIKvghgIb01g18JTYF3PphmBjWBc4KboHQvT1uF93pMvec
 +Buw00c30GdyYqNwi1kCdObGq7RsfL1keaLgzXjfeeAFMy9Xl9hGqeR0N7iJarQasokVPp7bTCG
 OMeV8LrmEvkAeMi/vA+z7DBTtSzOFzEhtClktV2pf8rBPY8nu0MHdnrJheNJSSnVM7vWThI39Gp
 hzp7uinuioBaiokJO/g==
X-Authority-Analysis: v=2.4 cv=QahWeMbv c=1 sm=1 tr=0 ts=6a60c483 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=RFcdKQwhVAgsHQyBjzUA:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_04,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 clxscore=1015 adultscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607220130

On Mon, Jul 13, 2026 at 11:28:18PM -0400, Esteban Urrutia via B4 Relay wrote:
> From: Esteban Urrutia <esteuwu@proton.me>
> 
> Migrate to qcom_cc_driver_data, which is used by other clock controller
> drivers.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Esteban Urrutia <esteuwu@proton.me>
> ---
>  drivers/clk/qcom/dispcc-sm8450.c | 38 ++++++++++++++++++++++++++++----------
>  1 file changed, 28 insertions(+), 10 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
