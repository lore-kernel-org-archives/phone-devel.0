Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BA752C11DB
	for <phone-devel@vger.kernel.org>; Wed,  8 Oct 2025 18:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759949837; cv=none; b=Qr3g398Q9PlS+2ag2Wwkq+OOdXNDuCndVgHd5/gXKsLu5QXxO9xlLddDBkMbc0OG0LbPrvUvo8CNoX5jqGTLgHVdx/cJ3BCxE/bh0OxXATYYBdMjPd4hFlonY3uTMGpS9BPagGMipJmapQn+vWnozrpTdR0bzMluCvb0yKyrZz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759949837; c=relaxed/simple;
	bh=lNNabX9y//09HAmK/wCZmTMi/LX+nJSbSpB+/oKF0sw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VhGhfD5Rr8ZPqzyMwZ0Wui9kzYiSqW5/fw977I91NulVh3bELwfYqVi+LuvZKsWpNE9l9t62gZBYzDRPXvKesOCrYNFywM9+3MmeCMc6us4l9sEok1f9kGlJW+bukKFkXbKfgA+biFxuZhQzz+EkByXI8SAiG3Bt9R4Cl+FmcWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R2GoJ7F3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R2GoJ7F3"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 598I5Mkj001477
	for <phone-devel@vger.kernel.org>; Wed, 8 Oct 2025 18:57:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=p0aFc3N38iuPS4vCQK31JPdb
	4dpa2Mqsozy5bXu0/V4=; b=R2GoJ7F3SYGrVEq4uMK+ZL8vTobBrxcZfv/eO4ww
	6b7LbBTBAph8LzAQ47y9uDcOpdAvKlORHFG+BNBzsKIok6yKOJ+nriAgDhL5nkdM
	ZfR9b4ch6DG1XQNwrnFwuki9zTO43j5YJyasu40KJGGjBrYj3cCBSd0rYUKwqdxR
	OEEApb7RPdUkJU9DsdKLF3LyDhWUCKlmOrEzQK76gEMQAfZ4aEc6kQ2M5TxJaEJw
	tAKesKlZ3bsbj/FHFk/S587AlueDtiRWsj+E29TzK4ts6SmhBOx/3vK5S1EAu9Vf
	YLHkFDvzP5zXLroFfnllR55+PDQB+9SMOY4Zi8DcFiM+RA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv4krabb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Wed, 08 Oct 2025 18:57:14 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4e484dccaafso9969221cf.1
        for <phone-devel@vger.kernel.org>; Wed, 08 Oct 2025 11:57:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759949834; x=1760554634;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p0aFc3N38iuPS4vCQK31JPdb4dpa2Mqsozy5bXu0/V4=;
        b=B+p6sSmp3uUvTRwO+VPYi5j8g4oH478fIm8tZHwL1KItRCSad4qCxTNx+o5LZPHc4+
         +g6U/s/pfr/o1hQA3BoSeuiNgQhqxoivNJ1j0knSkBo7LVFpIhrS/ODKCZNP+js/kjf6
         0HaCcDDhubZJW3KCTfacHfesJcIc9CZLuwmX97mQqKUWOZiKqM0cy+OppSWVODF8QR0u
         jR5GYjGZ9vhOMaLLrvgYMHRa9H6ZwkXbi/UrDathn7im3PQxlzzYZKgg8Vqnxkfi4fXb
         vVGs0t59W5iFWeolmPwW8uh2mEkqQMYZaxyFFks5Syb+2AFDWsf83A29RUso9N9CZ/P8
         OO+A==
X-Forwarded-Encrypted: i=1; AJvYcCVYBjNvzUNzYxIQzJ1aen6c9BlSP8zTOXQtRrYOELzyUOKk3E48fv+lRvDb9yjEMHPpHyRFvSG6mKCpfA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwC8zeyMUZHAphWJMzeeltLS6nG/eYhAAo/fbP4W5BlmZ2B3UhB
	v+lgkOM+rcOdVateOjOfndLhrpTF9abIofReg+OMw/Rm8Y1jaw2BIS0RkUnO5I8CQ/Q0wywcj0Q
	ER8QznuWpHJtN9/KuwTHCYq+R8uurPV+FzFlGfccjwFHOQb2gxDE7P31WFl7myQEtbA==
X-Gm-Gg: ASbGncsWRmSeYC222DF+qANCL04dJfdXBUh8HDhmnFsstyNihOXlE9zRfkDNXm+Fq6B
	rOtuX+iTA5PnbCxaXqjvpaURwePEUkN17sIQCt0lRbMgqZvA+DJkHf8XKgmHR96GA1w9hIbN+3h
	Js3DI9FFgVu/nJObHnoeNdWO8zsX8b+rYJQ4zpSkbSF9uJTV53HpfACRPBy4nluwAKD4DSzNd3s
	gn+pmCsCgcDKoSHTIEyUE3/gcdb3U82WhQPfOMdHasq6BO7muZhwNITJdSMlsyLGJNyC2WL62BD
	amLuJnlQSXMGPxpIBA2m9fwfyu86Np79jySS317RtBTbvJx+jvn4luYyHql/RfKPYhczDhtakfH
	MucBI4UskKngNAB53snbj0NvVzH+Syuq9K6ZZv//GBeZ0m+U86/aeOA7qiQ==
X-Received: by 2002:a05:622a:190f:b0:4d5:eedd:688d with SMTP id d75a77b69052e-4e6de8a86efmr125502681cf.30.1759949833045;
        Wed, 08 Oct 2025 11:57:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFtgnvDZEe3R26wa60RX9Q/fh5xcAmGuy8cV2NOzK3jPw+TTeGR+oVDeRwF6NVJ0ITQRNBStA==
X-Received: by 2002:a05:622a:190f:b0:4d5:eedd:688d with SMTP id d75a77b69052e-4e6de8a86efmr125501911cf.30.1759949831413;
        Wed, 08 Oct 2025 11:57:11 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5907ac0d417sm263816e87.34.2025.10.08.11.57.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 11:57:10 -0700 (PDT)
Date: Wed, 8 Oct 2025 21:57:08 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: david@ixit.cz
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Casey Connolly <casey.connolly@linaro.org>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        phone-devel@vger.kernel.org
Subject: Re: [PATCH v2 1/7] dt-bindings: panel: Add Samsung S6E3FC2X01 DDIC
 with panel
Message-ID: <7askbazrkbny5jlw6cpxcpjyw5nyiozmksoyj5b5momcc7w5hn@r3x6kddatf3u>
References: <20251008-s6e3fc2x01-v2-0-21eca1d5c289@ixit.cz>
 <20251008-s6e3fc2x01-v2-1-21eca1d5c289@ixit.cz>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251008-s6e3fc2x01-v2-1-21eca1d5c289@ixit.cz>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfX3mQ0ElrauSji
 OmLocODsRBTUiem7t9N9XhUPdB8k8xf8KrBAVzJBYMnSd4XRaKLGFTwnbJFZyKFdH6H8EhXXJUK
 CRitSz+HRQzqvhZJJXUOah1x9K4rWmABNZrVLPxrLOW/RLAUgaGpeTT6mfCdNGO5QUP5M6XZetq
 Z8mbYbhEwcyq+odQOABeK3txwFuh9gC/X7eMpZCVv+C3uU/jCgSbDzNNNHppKDBQq7C92ejN0Lf
 JIjVxrwaLHbYD2eUkAXIUT6MY1fRcYFT653EhLtmYHPy2VNM6iui+WXemruQwV710GuftwzBDOF
 R+lEUK+ChcUA0d5QIMTJ31U2/3mvGg+rZ6HuiOAbVUUJshIF+AzI0kduqSg0EIIGPIxE/+NpDM2
 qSVOImPGabKpCdOi2PNpWtqgalkMBQ==
X-Authority-Analysis: v=2.4 cv=CbcFJbrl c=1 sm=1 tr=0 ts=68e6b40b cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=pqhIxt2ABfSOU_N1PyUA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: wio9CIA5EfT25X-m9IlSrCqqCMGWeboz
X-Proofpoint-ORIG-GUID: wio9CIA5EfT25X-m9IlSrCqqCMGWeboz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-08_05,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 malwarescore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121

On Wed, Oct 08, 2025 at 04:05:28PM +0200, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Basic description for S6E3FC2X01 DDIC with attached panel AMS641RW.
> 
> Samsung AMS641RW is 6.41 inch, 1080x2340 pixels, 19.5:9 ratio panel
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  .../bindings/display/panel/samsung,s6e3fc2x01.yaml | 78 ++++++++++++++++++++++
>  MAINTAINERS                                        |  5 ++
>  2 files changed, 83 insertions(+)
> 

Please also describe, why it's not enough to use defined compatible,
samsung,s6e3fc2x01. Why do we need a separate schema and can't use the
panel-simple-dsi.yaml

-- 
With best wishes
Dmitry
