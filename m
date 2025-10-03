Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 914E826E71D
	for <phone-devel@vger.kernel.org>; Fri,  3 Oct 2025 21:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759528190; cv=none; b=iueDdeb7/2KLyI+bm84aWhycwqBs0NIyYzo0GsmAkfaCjOL5FcCVXavLqYD8IaTTCQc7QIuBNISXGUhdnJ4IxYos6GQffuzx/B86AiTGzTA6jYESbIkB+RRdE3ZC+GmPvG1IDTdiWAKiy340cw6TZ5MPAAyw0/OmlJ3snfxLB84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759528190; c=relaxed/simple;
	bh=V2Wkyjp61eE2yNsrEBIrnO48rBvAdczr/Veo5IHkEoY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GOzbmSS/+LBpNHuTExjGFNuxCXUBVabRpJ/GvfWiPRQ3mgPOKTbS5sDsKvrP6jythttqwuKgGfdfNrA71Iue3DOXqqrd5Jf0aUmNJ6325XTci9DViu/P6QcpkiCgWfOyMzwK7tloH/3qKsNksw/O0nI5F+l+zDlxQRv5Z07WT+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b69CqWUC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b69CqWUC"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 593Ae3F0023326
	for <phone-devel@vger.kernel.org>; Fri, 3 Oct 2025 21:49:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=CXTO/NJSy1u0WPzx3mtYRDh4
	ZwyImi0h9HK1EEN2E90=; b=b69CqWUCPXNQx+XR9KGvjrsELBSn1i0u8Y/CZX3g
	Ub4gODHQGEfvPZ81Kd1tem2N4sxj+E/KQbDSL4XOPc54KECL7eM+g4jvn259jwSB
	1bEcEYAQRnvnYAdLYupuU4n5gwymNGc0lHuu1npmw6qgYyMfaIdYknzr2p/zZUXf
	46bA5giMFN+BdF59vk51EXdJcIXVXmGWAOpv+2BuLrnEhPhWZNiqasJzkWzjZXoh
	uUz2F1hWNB82zsw6qGkiAl7y0odTvr0utvruHJaRHD+0MM1pO9o/ePn4wZdaf6nP
	BiODUX28TJNYZKkzzX2J6c0WP6y5AK640XYne8NlBaYxPA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e8a6c2st-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Fri, 03 Oct 2025 21:49:47 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4deb67c61caso78444441cf.2
        for <phone-devel@vger.kernel.org>; Fri, 03 Oct 2025 14:49:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759528186; x=1760132986;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CXTO/NJSy1u0WPzx3mtYRDh4ZwyImi0h9HK1EEN2E90=;
        b=Ogp3GD2mtziLbQ4YzMPkk0ZSRkrqLnhXVIP56AZtbeapVV7qGvCZtDUYljhfY6/4MF
         qG7UZ+HdaZXGv25PWp97pjE7+T0uiWxhsnrH05wqJ5TX5N7/syhVUbu957C08ffCuHUz
         TX25X5DidNGi1/N+V+umLIqyScYOVeMQ9IU3fiqdkCArnyZ3WKByWpgeiVtLhP6F9mxg
         MiMF3FrsJJmv+Nk6ZP5U4Rr9xxehSjlTNdU7LNLDJxMUiuOjbs1AJLV0hfFqFXEM49E6
         l42sXE2jJhViFr80P8wtU50zvcluhCBGjpi4btqD+TAVC8utC6B3AcGdXPt2iPlCK8ED
         smuw==
X-Forwarded-Encrypted: i=1; AJvYcCUALCofXinimdw97gURvyRecZgDrvTOkagvFeH82XiQY8XYGqoFr4CyqdCzZvLF43z3nYdODS/FP0pVzA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0eYnJu9U3KAA8dX60ml+DzZ1wOaXwHmnXacDwbMKgGBw5NXUh
	ZVA88q0drG5qEhiWG6wjKNtFum+xl0ppcdsKT8U+NiZgkCjIyPBuY2uiv8uI+LmEHPyaSi/LWOM
	zpRb+P2gOS7aQH5LhvR/PIwj7/sFPIwLpk6gnkNb/0lG7mIVcnE+tdokEgadU2rp2nQ==
X-Gm-Gg: ASbGncunnN1KCsdym50dNuYZjVGuXltvJc5z7mZyccrCfReLgsfjZ8cpohURSssAQi8
	Lq0Fou+GpINHpXrvnyflGQEWqwuqsYtpbD0+BDZOfkyY6hJiafPAWI5YdWlXkXp0DsISY7jUruJ
	nCAeCTweWYc4v2NgzG9HS8Qcj1IawGji9o4c59Z8GwlIvJ0RsZU12XAdSoK2hAWDjoU/wTK4W3A
	Z583Z3k7rEQshrvHX+XpZIkfKSFLgWDKzWlILH/6NXG/kD8LVzwKCKTA6yulNfA/ahGJTQMB4hY
	fNnc5D9I9wA1+/Xc+8qS88U3HK10gkKpGSMeadc7lxe8+DXWNixPmNbRgBPbU4XbcVcCUYsmKda
	e5p1HT3Ke3aszF65FlqgjoRykYMBZnKObNJ0LHqOS1PeYZH5Ddvx+osqMjA==
X-Received: by 2002:a05:622a:8d:b0:4dd:3948:3377 with SMTP id d75a77b69052e-4e576ad86dfmr68919601cf.58.1759528186457;
        Fri, 03 Oct 2025 14:49:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFqQ5JrGSaAju5feGXkIeOACPcymH0FWHYpUhlOk5LHmhvDelT1A+t3RRJ22rsbo+36OHGoLQ==
X-Received: by 2002:a05:622a:8d:b0:4dd:3948:3377 with SMTP id d75a77b69052e-4e576ad86dfmr68919091cf.58.1759528185860;
        Fri, 03 Oct 2025 14:49:45 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58b0118d6dbsm2208525e87.82.2025.10.03.14.49.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Oct 2025 14:49:44 -0700 (PDT)
Date: Sat, 4 Oct 2025 00:49:42 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Paul Sajna <sajattack@postmarketos.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        Amir Dahan <system64fumo@protonmail.com>,
        Christopher Brown <crispybrown@gmail.com>
Subject: Re: [PATCH v3 08/11] arm64: dts: qcom: sdm845-lg-common: Add
 chassis-type
Message-ID: <xeu4vsmkfws74qxnzwmsbvdr76taapa5bvao6notfttu74yztf@fq4ap7hid3yf>
References: <20250928-judyln-dts-v3-0-b14cf9e9a928@postmarketos.org>
 <20250928-judyln-dts-v3-8-b14cf9e9a928@postmarketos.org>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250928-judyln-dts-v3-8-b14cf9e9a928@postmarketos.org>
X-Authority-Analysis: v=2.4 cv=RZKdyltv c=1 sm=1 tr=0 ts=68e044fb cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=Gbw9aFdXAAAA:8 a=EUspDBNiAAAA:8 a=xpcYJZ5K4HInNErYrfIA:9
 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22 a=9vIz8raoGPyDa4jBFAYH:22
X-Proofpoint-GUID: pH45J4xNYa5PpbU0OjUV4NybTs25ZSCm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAzMyBTYWx0ZWRfXzOnwPP8tvRAh
 Kkz5Lvs6BVCHAHQOmeaLb3emepWJxYHbTWdXdPPSTan90PSqkSg3eB2qvYor7cTfu2US46XGPlQ
 BikirFlFWNnA7kdIPJsZ4cCT4iyUvm3Q6dB+WxqKWIDl+ykKVo7dgPsTVnlIB3bjx9P6/zbF2Bd
 BY6txH62/pmvt5oBJpFVAIC+41p82ceAIP3Tvby9rx+dmrsCksN2g1keMHOgMw5vS157Vztzfyt
 webd/0f7PMhc6To8+d0RnH1TQRXGP7IZ47kyaMf4aIfMcu8nvmxcd83QcXd9E+uZICN6Sz2kRkk
 xWp/V93QOOSKGAWRLsxgsq1sr1CceQCk4FF1/LEtkcUcOaf2xB1Efn5hPphVTGYv+voenkbhQxK
 2miC3v/jdkPzakdlJvd7ljjfS1+L2g==
X-Proofpoint-ORIG-GUID: pH45J4xNYa5PpbU0OjUV4NybTs25ZSCm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-03_07,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 priorityscore=1501 adultscore=0 phishscore=0
 impostorscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270033

On Sun, Sep 28, 2025 at 10:05:31PM -0700, Paul Sajna wrote:
> The sdm845-lg devices are all phones, therefore handset chassis
> 
> Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi | 2 ++
>  1 file changed, 2 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
