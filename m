Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA4DD376BD3
	for <phone-devel@vger.kernel.org>; Wed, 25 Mar 2026 22:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774478433; cv=none; b=ITy75GGjCEetBQ23C6Dx31cdOupF1zZksL+alnlzgcHUZtq1cWBnvq8hsxY+8JOND2iYNThzBIevF5iwPp9+GFtISrgye8nKecvyuwDaigMdPLa0xcXCO/qto8dhr8hZqMLl9dXUvq+5Usq+btW71xs3HRe3ywIr0UUjAOP9kko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774478433; c=relaxed/simple;
	bh=M3wrH4b+LRUZF3FN2M6DKwvla4BfXgDsUeFyx4ljtkk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Do2zashTYWbEKRIlAdJ/X24+5YQhFfPielsUQH3eCSvidI4YvR30NLjnhaxWVeExwOo2Z8IVuxm0DxP3iyBggWs9DpCnRaQZwizxL4BZ0Ki/fP8DflU8iKbhWZJvG7j3XyJcF+L8oy+gpJQ+cc9/yIUAf4SkzL9OlZQCkyueIUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kmro4bmo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R6G5CCca; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kmro4bmo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R6G5CCca"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62PFH1Tw1554595
	for <phone-devel@vger.kernel.org>; Wed, 25 Mar 2026 22:40:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=RKYqQ0dwW8xuJgMJdvmszTAy
	PcSofCCo8nVIzS48A1k=; b=kmro4bmonc+TqGDtD/9KUXC3tqseV7KpjWqogEj4
	a0QCUv37Nc03txe184DLxG3DcNMAEoMTWEjzHgCSmvePIvgsJHaF8W52m6k3v3Dc
	9/b7KDE/GLX5XqOQpOT3Vbc0zidboUWQg2D4Sw18NjSctgF91TSiOIRzm1XCnGAX
	4lO4YHdu/cCcyynOe5pr0vTJjSakbAKgZJDwQJ1RDaU2wS+qKW8MQtD8ofruTqO1
	FTqxL6x+n2LuTOXcPZ4IWvv7bC8SS6T0Ltp/uUP64z4DrIjp196uQhYvUpN2pkNF
	QY0MgplrkHC0MbmUB7H4FRnX0tT/Q13V5MA22WDY6NzdLg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4gj79y56-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Wed, 25 Mar 2026 22:40:31 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50925fed647so12079561cf.3
        for <phone-devel@vger.kernel.org>; Wed, 25 Mar 2026 15:40:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774478430; x=1775083230; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RKYqQ0dwW8xuJgMJdvmszTAyPcSofCCo8nVIzS48A1k=;
        b=R6G5CCcau/Ei7EWBPVn13nr2bAFAaL9Lnje3bLaniCl4dXD/R/cf9sQDkqi7JlBaBX
         /jf+VS5aiZdJOioLxD8Tx+IQEVttNC0bofzg/V8Yi2kwMALFaTmYfRjBU1WSbA4XsFg8
         INSveh9k2z6SBfgRNYiTSkoILXrTnGrRmTZnJRKX0k7BGpB7XkAhREyQPYSWzxBizzdn
         UAMHTlrRjCzq2Gvs1IBsiPHvAdlES2gwQ1BI3ATv3YB8lzhF2TSPvuXHqzU8qzDnG3MM
         nt+crF+lvnM7FZ1wZvmafKF3+tO4Og+qSpUBt3HF9GNPwSBtbEEfWdf9qc3/ISfLa01Z
         a2eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774478430; x=1775083230;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RKYqQ0dwW8xuJgMJdvmszTAyPcSofCCo8nVIzS48A1k=;
        b=IkJW9OC8soUqtcEwB4R4MX9iZ3sY32AdjQpqZttK+pS9boKklUlCJkYA7HAX+paxf/
         so12XC4I8Fciv4qCb9nflDIOH09DDPjfiXCEkLAy2e9WvcqxDKJgaXPkDCcw5XaI2VTJ
         4ybUGk2fF9ZQ58AIQrtcBmduijML5qHd/8JfDfGMQqmPThrKmE/MQsMP9VEL8uIfnTSk
         rw7hj/d18C0tTly3ZxI2BXRMPhQjDzXT0x4JOwMWDfqgRegIMVyI3YPFJl0OUUUJ7I8e
         gUJIwd2LWoVGp4f9b2EgDau10lEe3YtL+6gIOxQL4tU+qr5Fm33qhjoOcmAopXVrLpsG
         GxAg==
X-Forwarded-Encrypted: i=1; AJvYcCXSsJp5zfWvGu0hBuEtecTZVR295/GzyhtCmyPG7AdRjnpmiNKAIEjnQcOnYYEc+k1WZ8spTFOkXy4TpQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyknUX5iLayUPUfBwwBYHy0FURtl8+JbwdQ8KlwlzSWND1c40w5
	5NK2ujJ0oFCNtyjQzBmOm8ROSFj/kgR78SZCNk0MNaboPhwcWjsXtnqFBlgYk65dcyQEEkmEvv/
	AMz33L55tJ7CyjTpT9L65+7oQ6VhfRBxVR4dQJEgtM96OkrtS+mFmq4QnHu7HGfFKmg==
X-Gm-Gg: ATEYQzwRXXSzeauktfrp+R2uAGI+wX+4e1geeG5XsFHwe7s3MUTm1wkrsNTLKlZr73V
	IRGcDvzhCGTcM3Lkc8jZocYQ/Ypx0ikdR6TA/xBOJTBuiFElg3NlPeFpZi+gWD7tCCXWIowosSu
	wRqho/4i985QEQc8dmmSOj5cV2VH9f/IIEWhMlnorvB65iapsLvYQYU4ccRTLfRUk5veKTUIQpF
	Cm4e8NbmjaF6gLiwTjJPS7V/9PbfMWevFlHd8evNmXMVM2Euj1gf3Tz7VpdF9GWb6W0uTrk422C
	VPtOCr0L6o3JqD0252s/gEHukr4iBdGczmeAhCviT4Olu15OaABd0uriZt7VQ7idfzh0sj+2pOD
	boWoCKWpl4DdZxssVqhLeRx7ngWhuccdIPWZAY7A1zi7cOx7ms0MCpJZ2TZ+899+k3Rarhvk=
X-Received: by 2002:a05:622a:11cc:b0:50b:532c:2ab0 with SMTP id d75a77b69052e-50b80cd3515mr82662471cf.4.1774478430164;
        Wed, 25 Mar 2026 15:40:30 -0700 (PDT)
X-Received: by 2002:a05:622a:11cc:b0:50b:532c:2ab0 with SMTP id d75a77b69052e-50b80cd3515mr82662151cf.4.1774478429762;
        Wed, 25 Mar 2026 15:40:29 -0700 (PDT)
Received: from umbar.lan (87-92-245-163.rev.dnainternet.fi. [87.92.245.163])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38c52fb15ddsm1810051fa.16.2026.03.25.15.40.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 15:40:28 -0700 (PDT)
Date: Thu, 26 Mar 2026 00:40:23 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Biswapriyo Nath <nathbappai@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Pavel Machek <pavel@kernel.org>, Sean Young <sean@mess.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Martin Botka <martin.botka@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org
Subject: Re: [PATCH 1/7] arm64: dts: qcom: sm6125-xiaomi-ginkgo: Enable
 vibrator
Message-ID: <67d4gbz5tccughmlb6tkzv5fgduo7ih6ht2avcq5o3deiwjkad@wt72gfijbx3u>
References: <20260325-ginkgo-add-usb-ir-vib-v1-0-446c6e865ad6@gmail.com>
 <20260325-ginkgo-add-usb-ir-vib-v1-1-446c6e865ad6@gmail.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260325-ginkgo-add-usb-ir-vib-v1-1-446c6e865ad6@gmail.com>
X-Authority-Analysis: v=2.4 cv=M9hA6iws c=1 sm=1 tr=0 ts=69c4645f cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=+WgfKLcscl3VAWRHYO56eA==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=vaqIg2kkDvR5jWT7QgcA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDE2OCBTYWx0ZWRfX8qd7cYqdMbCr
 GsabKLSpJApqHUeczJvOekjDyU7LIJXM6/6ZiYLw7HpBv0n1TM/Z3IGEJHDF3kxEPbe30+8itT7
 W0KAxoqyd/rdiZv9wHERcAcLRtCFVOsnBVaNqTUosVlDYq4gBzd3Y1wT4cH25dBZhHBVaTn6dT+
 1XR1BM20K3hJjxHnp/ytZb3ZB9VsCpXw/80dQnrOjeZCfxC4QtM+baJH7YdVtTKUX0hXXMxsaLI
 N1YRG5dbSN2M5afZv12J1ZYhw2mcuo5ohEnRkzAWIvQL9FAGIR/LX3S7kjTyTwMOHa1aYe5iQgQ
 3OmBsqdtkwaDOteIh+kf3AkSSsg0QrrVSAuUXfJIFBUj6w5cn7VZPw5IQg5c+vCwdEi1hM/ErvK
 Zjzb3d1X5DWF8mlDrALYymfQi5Cqm+RlPBvbgVSG4Q3FAtwkN2vG327MRfX9LI/EjOxUYkD6B1b
 loa2eWQMEohaw0p750A==
X-Proofpoint-GUID: wHWCoRI8ySvinp_tS1TetV3FYQ0t8JrZ
X-Proofpoint-ORIG-GUID: wHWCoRI8ySvinp_tS1TetV3FYQ0t8JrZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_06,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 bulkscore=0 impostorscore=0 spamscore=0
 adultscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603250168

On Wed, Mar 25, 2026 at 06:07:24PM +0000, Biswapriyo Nath wrote:
> Enable the vibrator on the PMI632 which is used on this phone.
> 
> Signed-off-by: Biswapriyo Nath <nathbappai@gmail.com>
> ---
>  arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
