Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DBAC29E11E
	for <phone-devel@vger.kernel.org>; Wed,  8 Oct 2025 03:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759894170; cv=none; b=hgLCOisOiIumcxga/+QDSOkUC0JpxW/C+Pmgcrt1cMB68enSrgWiRPaGmhkPhtZwWtmNTOTndtE2G8qk5ua5dGQCaMp89i/uyS8PTELhGOOGhrBEZY6JW4C6O4MAH1upO/y6Js3wthcR/QpGgU7aUIpP36pa8Ohc5AQwhUP97ns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759894170; c=relaxed/simple;
	bh=PhC/2B+2mSbFA9P1cevxdTv+G9a2xtf0omNJybKc1wU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hRnCy8oZQDejB8V4xkTJxhVP2+O70JcpY37/cUeHlfaWIVDoP5Y9mI7zgimp4NuufiqxCcy+T3KOlX3hi2hf6l5SMIN/yamy6PKy68moUk+OITKhIxP5VzwpNYKhKuX/L+xy9heICErMlkaFC97eOg7rgO+Wy1jr/XqxykEvNmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LO4bZPhY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LO4bZPhY"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59803TYr005965
	for <phone-devel@vger.kernel.org>; Wed, 8 Oct 2025 03:29:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hb5DjFcBZ/27YR59szZGZtjq
	+9HN8vs9l1pnCZa9knw=; b=LO4bZPhYIUWjzodfMIGxtaOkz6y3sCxainM1BKWI
	R8vql3u8rKdDuIPiFKSuEXYWCFU0Bnm7dhoTsLxl/ZmpnuAjcGOVmA1lC9XeQbfB
	5Gmxhmspv1CdZFAKG1Wv1SX3Iz4ZA75kPBK1YdIDZ1Alx2qO9TSGldVFCJw3/sMa
	avcenaQUTcR+x+bg5SMAeALK7Tiyiq9GGmbOqWzpK9DpjzDYNTF4LLH8bz8EGNKF
	PkLBLshs1NpMff43sgCr7wZfhzU6I/rQxHgk28U+0fhM+MTFeca2N0mj7kc+psK5
	sZSHlyu82qsht+4YRsrAy2DJlzwudzYT5gCLKlw33YxMAA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49juy7175e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Wed, 08 Oct 2025 03:29:27 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4d77ae03937so188029731cf.3
        for <phone-devel@vger.kernel.org>; Tue, 07 Oct 2025 20:29:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759894167; x=1760498967;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hb5DjFcBZ/27YR59szZGZtjq+9HN8vs9l1pnCZa9knw=;
        b=SKf3uV/JrsbXvC53UekgRaGye/wCOehz+nVYopP8FlK1a6Oqd0TQvqE/t7Q0WRFedT
         +drHysdedix3w98JXt5FBuO8OHJvloZVzzVQ2YvFL4tukUCBWzQ7jejMN5t7W/tfhe2V
         T5zFzln8krGKwFJxAWjNVT2YH94HdHuWjsKr7+uZ7DA8e7maCEhu5Si0ydDzeH7kCjwl
         Mc/hlFvc/23ZGd/dK2RERzXg1brMn43NfTizrMaHNCzTcaN+AI1tKAocWRpMFAMmfdL4
         JnVf74PEWprhguhqodlL5ZprTTYbG3JPYXmni02MG2dqeIQwCuDEeRzxUfVnlaBuk/Ct
         J/1Q==
X-Forwarded-Encrypted: i=1; AJvYcCUzjH7g/RTyDFN+n46bIfKEmGQ1RE1AzMQol3MIlbLLi02BHeJoTwacioei21vHqGkW4MoAKSsjSqhbfg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8Kn87B++3ZQ6kQHdaWBDte6HViRFtcuE655QiF98YrKOpoYQi
	7eUTa34gD4LhU9OGgkX1ZXq0q6nU+VaUbWj6r0RWdJdZ09Jx05gLXQitX+DE2Kp8bP9LsDGnr4K
	jVfzU3cVdQN97NnlDxF990LX1/D7J7L/MaFdoWpXcEIQeKD4XzVAhWl/3Zd4UNJi6Eg==
X-Gm-Gg: ASbGncuTEVrwJgiUoa4KSREdZ5TQpl3NsHVwW1/9BR9bY8tnfcgtNnzVp8+6z/CxJD6
	SduZX9U09PKpXY/iO72JEmpvwvZrtCeZzNOJohH68icmAPekUw/jVvrUBfeGMwcINZVAEVCiU8Z
	4zIZ9zNn/l97lMwryXLcCEzUkH6JsFT1RY2MSknIspK3rUJapr5XJbgQgozTtviX8McQ7jhxr4w
	GFqPvzv2wndAH33FqLOeoRvbsnK5a7zx24T64auJax3/a8jc9QThCOUW9Z0ofgOhqEAofwN3bwB
	8FQiTu6ErV7qt7w8MagwAcsxvMmM4MjU8Na0/GlKNnGU4kpSBOaflf58wzotOLjKTV38NeLOi9J
	6bg2Y+TChwB7v5MOPbCWG5fG9vfHL/+d91r8hQQLAn8oNMgtnqWNc9iChVg==
X-Received: by 2002:a05:622a:5a08:b0:4d8:67fb:4185 with SMTP id d75a77b69052e-4e6eacdacf4mr25643441cf.15.1759894166675;
        Tue, 07 Oct 2025 20:29:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF0ym17qd6d8i8m9rZB6O5niP9nPtV34vtdf+6ORfgYkgZ/ZUEANvQEfhGIf/ybRQkhY43jCw==
X-Received: by 2002:a05:622a:5a08:b0:4d8:67fb:4185 with SMTP id d75a77b69052e-4e6eacdacf4mr25643231cf.15.1759894166258;
        Tue, 07 Oct 2025 20:29:26 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58b011ab25asm6715686e87.119.2025.10.07.20.29.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 20:29:23 -0700 (PDT)
Date: Wed, 8 Oct 2025 06:29:21 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Erikas Bitovtas <xerikasxx@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH 2/2] arm64: dts: qcom: msm8939-asus-z00t: add initial
 device tree
Message-ID: <cphv74xpoaltdlk5qjksmfjmsdk7fvpu6dvpo3bz2wdhtshaai@dxzk7qxro4tx>
References: <20250930132556.266434-1-xerikasxx@gmail.com>
 <20250930132556.266434-3-xerikasxx@gmail.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250930132556.266434-3-xerikasxx@gmail.com>
X-Authority-Analysis: v=2.4 cv=IrITsb/g c=1 sm=1 tr=0 ts=68e5da97 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=rlI1ognr9DFfacYL9GkA:9
 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: 6FNyjLkudXz1XU7nEVXSZzZWlrJpwai6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAyOSBTYWx0ZWRfX5CUw6u/0XNMM
 Zfe3Ldm9ZzM7knYnndkQTgxBELdhpENNeVn2qyKFEy9smsjK1lMse795Gyhf6hDozCVQHsAP6Hc
 8zCkyx9039jNC/cFzU7hGBSDMXhvS7qsKa+Bc/xGG9DkUZtHCpTJGN4bO8esTyklvTfH97O1tsJ
 Lg72WRpPnBSIl1gtxpSCUIZ3NJf6Ottlg3F1LpR3uUvJv0kZJRSM7USwDk+zgdlRIV1mBJEdjfR
 aWHhqoBSkhRu9KPTsdzk0/rfIJwFK53NBVNVKqiYFWh/jmrG9Qcofskpq6v6NaHX/X2gbXEmgKt
 jvNQLCBmdXdVNLyNvXVk+oaIIVJMhpi8FhFtQL6HPLqqSd94jlK1KGr5jqxHMBCuMsXUITY9DBH
 pa9oNkutBLUN2ZfzgdugUtaEA3uraA==
X-Proofpoint-ORIG-GUID: 6FNyjLkudXz1XU7nEVXSZzZWlrJpwai6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-07_02,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 malwarescore=0
 spamscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040029

On Tue, Sep 30, 2025 at 04:20:10PM +0300, Erikas Bitovtas wrote:
> Add an initial device tree for Asus ZenFone 2 Laser/Selfie. This
> includes support for:
> - UART
> - USB
> - Internal storage
> - MicroSD
> - Volume keys
> - Touchscreen: Focaltech FT5306
> - Accelerometer: Invensense MPU6515
> - Magnetometer: Asahi Kasei AK09911
> - Vibrator
> - Audio input and output
> - Modem
> 
> Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
> ---
>  arch/arm64/boot/dts/qcom/Makefile             |   1 +
>  .../arm64/boot/dts/qcom/msm8939-asus-z00t.dts | 255 ++++++++++++++++++
>  2 files changed, 256 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
