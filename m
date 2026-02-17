Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 491402882CD
	for <phone-devel@vger.kernel.org>; Tue, 17 Feb 2026 07:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771313845; cv=none; b=mTYLz7V0eZj9Y5tYHZCWPLXubSTLTSWjU2nmuPqezZZ1KWgXELRUvYclUm8JLLSiuLTrn45lncy9LvCDVXYcJQduhtJQyL7meecJe2DRSLCX+GghMSyffAimM/5mzYysEhI79WBa2W1SqKb8ErlM73kGpwB8wVPrTaFLY16jxYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771313845; c=relaxed/simple;
	bh=5ymOAA/qX+6v/E57hzw88s4Ajr+oAMkZohNiy9JVhZs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OR2kLARICoahvxu4snqCsYgZkQg2tQ4rw5EiAOxn46X+jQEaU4VrnZxh/Ppj4X6srtHoGD9h0h/s6joLUnsJ5Ms2PjrMumzm1K9WFYY37h6We/lHNuum4NVRCCmvGZXdO5+b0kkd6dBOP3DTHyGOLgMWc1EAestxfpE5xXpRt9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dxXzaQnl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b1baOH40; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dxXzaQnl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b1baOH40"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61GGUIDb1601370
	for <phone-devel@vger.kernel.org>; Tue, 17 Feb 2026 07:37:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=o7NIcT1Nl7BtalJetdwfHe6L
	kIdG75IZF8wDqN6G36E=; b=dxXzaQnlZRuyoSTepdhuy4lXDErSuQGkxStfb0G2
	EKllEczgyahk8p5zLZ3rY+zWADFhPIREp7X6xLWWs81BQs06lxCPfpR2ndij1Ctw
	cx16oNWJhavAkDAiqS20z5YghwyTdUFgZ+JOJhcBt5Awkpv3bZAFocyw0zJhcf8K
	SHPq16vqgi+h8rgiK/qDfQF52qG3lvrr6BYFmD6LLS8e1sbTWSN4qy9a5p9eix90
	NwCgdZoI2lZJ+T5Xh5k7I8dour0JheYLvwgd5/NO+OWIYRDz24k+H9ZxChxJfmcm
	5Y+jBDydAG4dY/LDtCitae4eK/HRGcEhvbOrhILrkPAewA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cc6tm9ef5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Tue, 17 Feb 2026 07:37:23 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb3a129cd2so2828984585a.0
        for <phone-devel@vger.kernel.org>; Mon, 16 Feb 2026 23:37:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771313842; x=1771918642; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=o7NIcT1Nl7BtalJetdwfHe6LkIdG75IZF8wDqN6G36E=;
        b=b1baOH40IZMIPBH1HgQ/66W9fXI3ePqBV+HTa1PPlRf+N6EQsVchAMapcJhfKkG5pp
         eu7Jccu2lu048V0VJQ15a5BNm9s1cMngDpYBjgZ7Xf1mP4Nqb1yqUGgtMhN92061ZQsA
         BTSRkhWXHyOdmSn0ll9sy9+zf2MikJvjd1lAaHIM9cvtSP/3k7bnV/Zos11FzO58wg6n
         nmOZYD8C4mVMADkS4FxZq4UakFg66IlNH9LJa+X2zuw4Z/o2FdvwbqHHrcd1I3MZI4mP
         k1Y7d3piQgKCg2Xj18Anr5B8HjSp7dt06rTIKaX+Wtbx1wAel51+/NKeiIsjSbLCCKQq
         cI2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771313842; x=1771918642;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o7NIcT1Nl7BtalJetdwfHe6LkIdG75IZF8wDqN6G36E=;
        b=cI1Gmn/ZasEJChV2s0jh9VXIds077tMwxP20nm2+FLD+LqNaUzM/vHSTeLADEfychb
         K4NmJgi5yX+1WgKWnX3VcYHlNiHX7mi3D/v+Out5T9u6LNo3xMvhbjGvW4LW4SZOl6lS
         Xy+jrbOEpgokVesUrIuuBRP0ddLEi3BngD/W9lMJPB2+66m9xO8CEalQce19C1S1MZ1h
         RdEEO8HGdFL8C8mIGZEc+xiGaVpv6Ka0+GPOCjDBI8ISZJFaaN61TWYkhTafa6v+1r5x
         1naslK0VQRJc6B5gWThyporpo0ftmXBg6+BG1PAk1Xednpcm+zDHXGG0/C5JKFatzRWp
         J/sw==
X-Forwarded-Encrypted: i=1; AJvYcCV35ycGHx6iGtAEJou770SN9v0uqlnFTIyj2RnYbSRYLzDqQgsIMNNyUjSMqieSj+QD2afnn6NX6/IWgg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx50u7x43oR5vVFjzG675CY4tn6Cj3ztu4D5PpiC1WgHP+thQTK
	5pleJyeaXilOHE1PsdLCx1mkl/qGz3xa3MosNGo2A1niEw7b5lSXW5TADk3zOgY0o+em1KlFCSr
	jJ1+NtfAMNvwpsoZUvhMyfRcxC5DMUmN4krwkh+E5VgMc9l6C6ALZkm9GZ5J/aTUfZw==
X-Gm-Gg: AZuq6aJFY8YIt5OiKgtK6SfyR0X9H95+AbvCNPx//IOputLwCCrwgiFsHkzYceTVu/a
	SHj26eZbRMg52QC7zrBQbRGh+s7g6qbiyUPeeEGN23GmGHIF2hyx7mCL9nbBQacLJOlAMH9v6D8
	iPJ4G4T5gCYAnMP9ci7/NRdZtcRkYL4bgg8cwT9gU8emBtdPhfq1LVqs2yOS4W0Bas34hwYH/vo
	Tm+HPh6If4Uk0eBnX3VqGYQuOBjPvywmbSqgcRIp1jQ0VUAMUWfCaMXPPpCDOaUw8AMfOFrCFZB
	jMBOUklvpF2Rwk7FyKx6+z+ULwH4v03wUv22Ujqr1CaoZX80p0sU2mO1sn9DPu2GkkuBhEM4dOc
	rMLWOyGhv6uKBZVVSv+MWXPR9qkty7UF5uLKD5lLIHn5oIjyaSeUL+4NUBmavfHG45QXuQKEdsA
	a1kyi/CNdOqtul/veqq87GHw/7uifw6zYbNN8=
X-Received: by 2002:a05:620a:19a9:b0:8ca:a98e:bd0 with SMTP id af79cd13be357-8cb4ac6ba5dmr1309053685a.27.1771313842593;
        Mon, 16 Feb 2026 23:37:22 -0800 (PST)
X-Received: by 2002:a05:620a:19a9:b0:8ca:a98e:bd0 with SMTP id af79cd13be357-8cb4ac6ba5dmr1309051885a.27.1771313841945;
        Mon, 16 Feb 2026 23:37:21 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e5f51edcdsm3688319e87.0.2026.02.16.23.37.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 23:37:21 -0800 (PST)
Date: Tue, 17 Feb 2026 09:37:19 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Val Packett <val@packett.cool>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/6] clk: qcom: dispcc-sm6125: Add missing MDSS resets
Message-ID: <oudixl456f3lzu75npcincr3idh6itkbmltd4ypu4ry5ncyxe4@epuii2b5wl2z>
References: <20260216233600.13098-2-val@packett.cool>
 <20260216233600.13098-6-val@packett.cool>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260216233600.13098-6-val@packett.cool>
X-Proofpoint-GUID: gNNfSXya3zLrIyC-CV1CYbFDq7kXbiC4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDA2MiBTYWx0ZWRfX++HTJhK94LqJ
 zB/PqnqrgpKxcubfyq93rDpPdKojfdb8lu9tpTJhkBY+/fmAVre8I1hyL6J3zMF8GOmGpMyUZIc
 n+TF3f6U1D2OYZicUCvoea8k5ggCxz9AWo9uuuf/TkvAh9FA7x8Spz+ySagW5isJ1Q/67ZVXQhv
 zlyowBvnlkQNsk0ehDBzZJHlEmKNy+VRP8TZqMHfRRVgLFDBhOWrNAAQ+14W9tezks9sALJ6cgr
 vUv58WkmF7KOVPnmnXnClQFWO+qDUC/OKuJdkGq120MLehb8l+JHugsIcM7vEEtoGMOqDikRsAB
 398jndDI81rZHjHcVO9S3dyLSO0GTXDdXN45Tx3wHFRxim0Xs6hGZiGMgoqbKjRR3NWcNdtq4qK
 5/QGjKQcFPlOFTe5L6Rd8bjcGNjY+dopGh6OUYgBkaPgQ+YPwkOK97oc58ec5BguDZIQlbtIvid
 ujMF5xEHmqwhBtT0Njg==
X-Proofpoint-ORIG-GUID: gNNfSXya3zLrIyC-CV1CYbFDq7kXbiC4
X-Authority-Analysis: v=2.4 cv=IOoPywvG c=1 sm=1 tr=0 ts=69941ab3 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=NzzAIdn2IQfWdxSLNSIA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_01,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 suspectscore=0 malwarescore=0 bulkscore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602170062

On Mon, Feb 16, 2026 at 08:25:22PM -0300, Val Packett wrote:
> The MDSS resets were left undescribed, fix that.
> 
> Fixes: 6e87c8f07407 ("clk: qcom: Add display clock controller driver for SM6125")
> Signed-off-by: Val Packett <val@packett.cool>
> ---
>  drivers/clk/qcom/dispcc-sm6125.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
