Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2BC13C1F22
	for <phone-devel@vger.kernel.org>; Tue, 21 Jul 2026 22:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784674065; cv=none; b=qroI9vYGTftnAOnFwmNuNNbRyAtrF25nkeg+7v6s9LvX94/LDD2L0BWueDFxU8KFcU+phd92i19V1twvNNqbJEBNbSVJPHbbR11sandPynsTr/+pQQdFUUTOdnrYuowWY4H2TH9CX5a5CixdATIJEBAdlusDwF613u1ui5e++nM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784674065; c=relaxed/simple;
	bh=KZ8jPzlr32ub1331C7LBmux3+jAzFbNlWFyK42tUhFI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KLpVMLZZR6TNPP9fOU+Cd+QYUDWP/RT39gUdOpX8KJNdHHQ+3vpqv1YmCeQlMAoaz5z6G93gg9TiC9tjkJP1WgUXjdwH1+AR0WbNmiwjBmPB/UP15ie6cIPKa+Y2aQk8I7fykQq63TeultUFd1uKnexOnrliPhYHl1af50fMja8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O4/qQOuK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FlLWCG1d; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O4/qQOuK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FlLWCG1d"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LMZP7E3026986
	for <phone-devel@vger.kernel.org>; Tue, 21 Jul 2026 22:47:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ZVRt+INxjSHKZ1UIV6a4RAoD
	Al3Kyyh9gvcFPMDgkLE=; b=O4/qQOuKkGRyWh0fTs/B5ziOHMwa58TywTfbajkG
	v4251LhcM8CfeToBoDB8gz1fBUO1yXpp5l+4xCIr5JPzQ9+NueO3eFVE/Ks43JFJ
	BL0z+SmfwCoGjY3X4ZQWQ7JWBUngFGGeJt49phcjjr4WPlEOJ+9+11hZgmCWrbMV
	GRUzN1ED8H38OfOgbRvfmIu57+AEIrM7tuAgIyzAB4hNwP7haPG/1bpI11vD/9Hj
	cJOo/9bbO2XMgiqZp4nOneJved0iGVjyrCol9smkSG+GH+Yy40nnOTcLcLF1eSXQ
	Xe4ZO++XwkOSPOp1cI3vUdMdIzbqKE1v2bPuyQz2qx/Iiw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj6pab8e5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Tue, 21 Jul 2026 22:47:40 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51bff5c7035so137154031cf.2
        for <phone-devel@vger.kernel.org>; Tue, 21 Jul 2026 15:47:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784674059; x=1785278859; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZVRt+INxjSHKZ1UIV6a4RAoDAl3Kyyh9gvcFPMDgkLE=;
        b=FlLWCG1dLpRwG7SmsVkP7Lic5nC9RG6jn+ig0JQTcnrfQs77ml3ZwCcDZwkUe8J4wL
         /rOKdVRpT8GVfQUxQHnZHcLi9+DBZaSBzIWSufLMV7QSyAQ5cJ7TBh1zmv5/gjrs28VG
         TaVaCNuPSrHbYTReu07eeWOF7pXCvjYKBbG8OaJXVY1KruP/7nZA0lsCAanYqpdiRVEu
         hRpDPC5LDim5aGymU1pghPeO+KZ1hYAnJbRR5qMxMNXw3hsBPbFOcawFosHdN2q9HFf9
         sjU54yRxkweJXcBSDLUr0VJQeuVjzFZWHxAdaRmuhQLrfuvw83BxrnMQmue9Hfh0KgHC
         hSgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784674059; x=1785278859;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZVRt+INxjSHKZ1UIV6a4RAoDAl3Kyyh9gvcFPMDgkLE=;
        b=nVu67roxl8+nuy/yDgzrlnGA13J4YZxOYXh4C+x8sfzvieSFmNmDqE8HO9hMjDY2ZM
         xw4ORnDfRCx8o9riflGAg3G3W3RVusRBz9cKXIw9WZ/wp/sEbEGRmqlEoq+w87McT4Ok
         UGRwANlE4QAVP1dOHVweYCOSItCzl0y6qxhoDTXk0n/99AwZkevW+LUks/ZM3/KIfWAR
         1OpR6GLb5l22GdHELefc1ig5qrxnO09Fg4t4x2jYiETkWTn09oTeLLrwS3ITwtHAsmUF
         j/fcSv9GQ/3aJ9DU865zaiGnVOEKPmwiZQHnBbBnh/JDax7su9qEZRbbxIkRWgiOH5n5
         ZnJA==
X-Forwarded-Encrypted: i=1; AHgh+RoMCNYCotKgFs33yYnyIm/rmtcn48rnR3lvLSBHYef8e3aRziXSf22K2eoiOSniNeh4MTNYxRCuO03R1g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxvriBooLM8GJMzLWiyswyuDHSUzRVE2LXVib+JhV0jm+J03GfI
	Z1hWUDH7PYT37LzNt9cNWYeLdpvaeqPBCu96jwt69+SD9uOpQX06WiAOgFLVy9tEzh0R9Oh8MYZ
	ltwQyLPmE8vk6Z0/xHgZm1yb/lXmDSNlcb8Wuyja/pM7tAXRBsb77eTX4bDpJcH00ehs/for4TA
	==
X-Gm-Gg: AfdE7clDWoZJChF7IsN/2893LYpoxOijYSgC2kz8LIlStH2W6mJ+RxDzWU9sBbWzqGP
	rb326g9Sh3k1Ck9RhyvPLkz/ggV+Rj08RDmFPOPLUEpQGwucW+Mgw/GcDTOJnOXBm5DJKJq8iaX
	OylnLQDBKLGGqKVInpKUYT2Iyc/OezHU7/PHVaSs/nsgWfx6OLoWtmyHnst1rJMIAt9s7jdPGw2
	bf8Hjfi1DzBoIZsxTQ2ZYW4reVRrJ8nIuONRc0b1RMbpr6fi5tG1Rpx30WBtdNTGHfFFMJqr4/K
	oaRpkBzCQefl4U6eLmw/89OvoAvSvyqi9irJWmHnLBUaYM7Yx39XxW9336LbjmzTlU/jMlElVtL
	LgODJeP/uIY0ndyyDyuaq9Qiss4aFh0YFfUWAqMIzdWoBg1crQKf1wqlBY92pnBHA1W6tzEMN5h
	jNiz8XXU0SDqrhVQ==
X-Received: by 2002:ac8:588c:0:b0:51c:e6a:1b5a with SMTP id d75a77b69052e-5213a47acf8mr200832701cf.12.1784674059427;
        Tue, 21 Jul 2026 15:47:39 -0700 (PDT)
X-Received: by 2002:ac8:588c:0:b0:51c:e6a:1b5a with SMTP id d75a77b69052e-5213a47acf8mr200832471cf.12.1784674058899;
        Tue, 21 Jul 2026 15:47:38 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2a9d30758sm146804e87.45.2026.07.21.15.47.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 15:47:36 -0700 (PDT)
Date: Wed, 22 Jul 2026 01:47:34 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: esteuwu@proton.me
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] phy: qcom: qmp-combo: Add SM8475 support
Message-ID: <j2oyolcgxtka734fn6fmv2fk7em6zkmrvkivihtldbbllmy4co@eh742ign7i6q>
References: <20260715-sm8475-bup-usbss-v2-0-2d8def39b190@proton.me>
 <20260715-sm8475-bup-usbss-v2-3-2d8def39b190@proton.me>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260715-sm8475-bup-usbss-v2-3-2d8def39b190@proton.me>
X-Proofpoint-GUID: k2I7ENZSr8t6Fn5Jf9KM77o_ZpUcGNUz
X-Proofpoint-ORIG-GUID: k2I7ENZSr8t6Fn5Jf9KM77o_ZpUcGNUz
X-Authority-Analysis: v=2.4 cv=eYYNubEH c=1 sm=1 tr=0 ts=6a5ff70c cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=0cGqrpNjlybS6BQeJRMA:9
 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDIzNSBTYWx0ZWRfX4vKZqaU/0tjr
 Fzxa7SjoCTvG1VmKxs2fQZvuMnI36hMqVCfIVfrBLwxhvXAfl3fccxM62MxcOyYgspL1NrKwXbl
 zr1Kc6+rLUwHitfw/fCJNak+EXaieEHnxxqOaxYtPAdhwt0ijZpiL5z3rYzVBoc4eknY4BL5749
 c3W8iGJ77hReYM91+rK/CWuiR+LbSASPk1Ayz6rmejeDdKyMu8QsQNoTgBQumnCfucd5b0zflgd
 LAXlf2wQL2aie2+R4D8IT6EO1YjMkz3gAupj3m92i9QrDIsJCGluRWoEnt4lCTXLTe2xRQA/aaQ
 183OMmwmMHf5Obw5f6mon0AwbeiEANRqhlmlEfJ6CCn/BheJMHmL1gnST2NrzLH4yl4gUMFGN5k
 r5lfISQ1XyXzFrgyXE8A+gaomY2n8WkFhlTSnajVzRxuF9U/opO+NrShEyYPc7Ml2moWQVXdpZI
 lpjnwAossItqTh8Eyqw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDIzNSBTYWx0ZWRfXwfrgDeUqv6yj
 V5Pv4zMH9G1GHNH1wG4H8i7ApUjw4hN1iovNuIumzuHlQbQCPsFfozmLvbkR5hAWtY18GdG69xS
 sd77YTRjYqGvai5Svj7UBZAfE/EHDCI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_04,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 spamscore=0 bulkscore=0 impostorscore=0 phishscore=0 adultscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607210235

On Wed, Jul 15, 2026 at 03:06:56AM -0400, Esteban Urrutia via B4 Relay wrote:
> From: Esteban Urrutia <esteuwu@proton.me>
> 
> Has been tested with the following capabilities:
> - USB Type-C at 10Gb/s
> - DP Alt Mode, using HBR2
> - USB Type-C at 480Mb/s + DP Alt Mode, using HBR2
> 
> RX and PCS USB tables had to be added, while serdes, TX and PCS tables were
> reused from other SoCs.
> Since SM8475 uses a v1 PLL, add and use v1 PLL tables as well.
> 
> Signed-off-by: Esteban Urrutia <esteuwu@proton.me>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 169 ++++++++++++++++++++++++++++++
>  1 file changed, 169 insertions(+)

With the v1 mentions being removed, LGTM.

-- 
With best wishes
Dmitry
