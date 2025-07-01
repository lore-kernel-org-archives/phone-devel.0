Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F8F68821
	for <phone-devel@vger.kernel.org>; Tue,  1 Jul 2025 11:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751368620; cv=none; b=qIdWIN3W7Bl7dwZWDtP0itNvNrOlDS12ZLzY/gYTT3youU1NzrSvkh1UczDrdzKTjfDvMzt7znPsbwgruFSaIFxTDSS/PtTDkhPFI3o7yab6VK0/pyVbglyMH1HSLZwEWgj7uI7P9/ZA9TofvtXxvTo5mWJvC1RE3Y8kB7ODHL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751368620; c=relaxed/simple;
	bh=P+AniTQtNOyYYO929SsdBmccebThUXBNEGP0tTQX+Xg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ow71Ydg4l2xDGwS8idqZJGWGtOZyb/VaJxvcY8pmZQzyp3zmUOEltD7O3v1U8EsGylDq8HNYiOGM02HphgXoYbNf2h3e3EBcklfdX9sajLkBi7a23rOGf7AfnnoU91pZ39aCpIkgecvNH5gPhThkhcQuCfKHy6gWpCQiSw8olMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G7PDeVf0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G7PDeVf0"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5616tOZM029054
	for <phone-devel@vger.kernel.org>; Tue, 1 Jul 2025 11:16:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=A/DsPTsBsBDmT1yFH6Ie1eyY
	DtQOwvGO1EI9mJaE2Y0=; b=G7PDeVf0vg+kdCXuIrrqktt00oLfENIIZzDDghVl
	5mZXfMXZI/cDcT7xbYlaYlxK0pmGbFagyxYsJz4dlGTxJmCO88X+5UKQ0fbXZQEC
	9EiF6/EYmZHAbJtX6LUAwkxBEjXut5t7kwZ25fuGLnWSRuNrnmU1Eq9HqdcF0FwU
	3gklU5U2xLVkjPGP5IHFTElefB9zKYEttE9O8uzrXm/6btQ8QQJeUCTxvcvKAEVZ
	Ze2XpYEU43JmoI2qEvSH8Xac8KWNE/7dBgr87I7mhFvchmts9Ox28KzhuoyLbjd6
	GeDYQ6mjAOrGrYTZPzbV5Dkd0wND7WvEaj5CJM0RP53pXA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47m02v2pgr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Tue, 01 Jul 2025 11:16:57 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d3f0958112so818532285a.0
        for <phone-devel@vger.kernel.org>; Tue, 01 Jul 2025 04:16:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751368616; x=1751973416;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A/DsPTsBsBDmT1yFH6Ie1eyYDtQOwvGO1EI9mJaE2Y0=;
        b=J2/CGrjS7mPt4decOgNADJvz+J3f2ueTiZ7ZdR8OwgA6Zr+J4tnjCkbkBsPjIKsyP2
         8/qGoaZ3BkB2SAhWoiwZOA0JTTXybYMHH+fBR2D5Ksikc6Xl325KTH0qW3PLn/oyyyiA
         VGcVe+0omC7pFgLKsAY81/zzd7snokCCj9N45hUybnGvrZ7Tk6UC31jFCGszPE3Xs+dU
         ylmDudOLlmpx2zgaxatCc1Fzpx45cLrB5QcsWT2j5yIgw3NsSQOsyXteH75m7TdQf9ur
         Uo/5hdAfOp0DOjBHvZ9m6kle99VtqKexiX2APD8vPKOsXDnIhoYmX4pDKmXxq/RvuhAS
         kSgQ==
X-Forwarded-Encrypted: i=1; AJvYcCVoZf5JMKopBcHJI64tnw9cD/e/vnrEVWZmEpVGrwQy+Vczk6cL/UcqYX5l4yGiHP1yRm1EhWisuqsw1Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxlzFsSgvKI/ODfqDgyEJQjljHRKwoxUC6rGSGK/dtfZPCvi0/D
	6Ej0PAGcG6jttPdO+fuvDy2DHeKMGc5g3xBAnfkDY9ER94KDynKikH+wC8klSiJ7fi1np8cHGi+
	2lfzAfzF7u9tis+41VOWwSoRxN0uye4robrII9J/w4t2GDFM1Axft/kG/oTva1j391Q==
X-Gm-Gg: ASbGncvDnxtfYOd+O63avfSuonMhETek9G8y0UXKXLPixqUN213Kupt/aNHq0Yf5UyQ
	qyn5TEB4rRDIJRNeB8lQ2MrU9/He140t3As4jPd9iCRKVEJZXZHYGl+vHSCM8CVSsCKAPyRc0th
	1TMrISygbR8jp4bEh3t+QVrLJ1j3QytRchrKCDzwrrsQldRlGqu4cDH9DLT489dJH1voHccluIY
	Ua6vBnE7miNbkYoTiTht516ceS16sCPNCWyXClaWw71bDfhx1qiBVerQU4ebTn9y+QDx5NlKtAN
	9LfKXXjK3E1a47ECSjLB0AWo2F8LbAARoDMsybERzFJrD5BYLbM+o3RFQTNQXWrHH4+0xYA1/Lf
	i1pAlBDsgZtoYgveN0R60NKnF6TQkuamOO7s=
X-Received: by 2002:a05:620a:2703:b0:7ce:e010:88bb with SMTP id af79cd13be357-7d44392577bmr2261951885a.22.1751368615980;
        Tue, 01 Jul 2025 04:16:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGZAnQsK8oP+yGp6Y9qLuzqAu6F5wPwMy0Ri51LK9L6uuIylK+nYr9DS+MORAP0pvUs/HHlqg==
X-Received: by 2002:a05:620a:2703:b0:7ce:e010:88bb with SMTP id af79cd13be357-7d44392577bmr2261947085a.22.1751368615341;
        Tue, 01 Jul 2025 04:16:55 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32cd2dead99sm15783941fa.22.2025.07.01.04.16.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 04:16:54 -0700 (PDT)
Date: Tue, 1 Jul 2025 14:16:52 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 00/10] Add clock drivers for SM7635
Message-ID: <w4eujq72uqflqpsqshc7zhu6lkc7owufep2g2rjacvzgj44vmf@auonp4ugbgow>
References: <20250625-sm7635-clocks-v1-0-ca3120e3a80e@fairphone.com>
 <68056b4a-b1c3-401f-8720-8e0c3cda6249@oss.qualcomm.com>
 <DAXEWQ93VELV.3HJXPNWASYBT7@fairphone.com>
 <DAZPKV5DQ1EK.2D4TQE5MIH4K9@fairphone.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DAZPKV5DQ1EK.2D4TQE5MIH4K9@fairphone.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAxMDA2OSBTYWx0ZWRfX6f1HHc3mkNfp
 WLRg0IliyZ1NYaGXYD3/AiY+iTuIjNl7edUcyeZS1mlzgXPFTcmUUlGZPlLUPMDHfa3WL7an1cZ
 rHJjG5Q0BSZ7vBGjcRvmu0LNtMfbezKK6jcK3WQxCatEb2HsdLzscySAlAejVXBan1Mou32Ur4l
 5F+PuUMuvD8Jv5bg+rWfiMZI+EBTONSuf2FESlhhwLF3HCvRO9BSttzB2OFu7pDW5dRGT4lF9XN
 B1BgefJgvz9GBoIBx520evl/Ua9nsNcd7raafTTqZDC16oEE/sg/oCbxTYIubg4DUZcmYjWd5Jm
 7ogn6YL30J1iqX3L1iwBFFrB1eXKmnwb3ugrS18u19FDorZ2a9d0pxmsIKjvJnrhSOpmFVtmXAY
 7m82n81MXsGka5Rg6WsO3tLfj7beG3YMeAmgQIkTiKyQU/88JEijugpZLyFGn4UFA1F/tVce
X-Authority-Analysis: v=2.4 cv=Y8L4sgeN c=1 sm=1 tr=0 ts=6863c3a9 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=6H0WHjuAAAAA:8 a=2CDl1CmQ9Cb19c7lbDQA:9
 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: aw_R8stDLwh7t54UG8lvCQzHe0907MQj
X-Proofpoint-ORIG-GUID: aw_R8stDLwh7t54UG8lvCQzHe0907MQj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-01_02,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 priorityscore=1501 mlxlogscore=941
 lowpriorityscore=0 impostorscore=0 malwarescore=0 bulkscore=0 phishscore=0
 mlxscore=0 spamscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507010069

On Mon, Jun 30, 2025 at 10:01:35AM +0200, Luca Weiss wrote:
> Hi Konrad,
> 
> On Fri Jun 27, 2025 at 5:14 PM CEST, Luca Weiss wrote:
> > On Fri Jun 27, 2025 at 5:10 PM CEST, Konrad Dybcio wrote:
> >> On 6/25/25 11:12 AM, Luca Weiss wrote:
> >>> Document and add the clock drivers for GCC, CAMCC, DISPCC, GPUCC and
> >>> VIDEOCC on the SM7635 SoC.
> >>> 
> >>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> >>> ---
> >>> Luca Weiss (10):
> >>>       dt-bindings: clock: qcom: document the SM7635 Global Clock Controller
> >>>       clk: qcom: Add Global Clock controller (GCC) driver for SM7635
> >>>       dt-bindings: clock: qcom: document the SM7635 Camera Clock Controller
> >>>       clk: qcom: Add Camera Clock controller (CAMCC) driver for SM7635
> >>>       dt-bindings: clock: qcom: document the SM7635 Display Clock Controller
> >>>       clk: qcom: Add Display Clock controller (DISPCC) driver for SM7635
> >>>       dt-bindings: clock: qcom: document the SM7635 GPU Clock Controller
> >>>       clk: qcom: Add Graphics Clock controller (GPUCC) driver for SM7635
> >>>       dt-bindings: clock: qcom: document the SM7635 Video Clock Controller
> >>>       clk: qcom: Add Video Clock controller (VIDEOCC) driver for SM7635
> >>
> >> We had a massive yak shaving patchset go in this season, please move
> >> the magic settings in .probe to qcom_cc_driver_data {}
> >
> > Okay cool, I found them
> > https://lore.kernel.org/linux-arm-msm/174970084192.547582.612305407582982706.b4-ty@kernel.org/
> 
> For camcc, gpucc and videocc it seems quite simple to follow these
> changes.
> 
> For dispcc I don't know what to do with this line.
> 
> 	/* Enable clock gating for MDP clocks */
> 	regmap_update_bits(regmap, DISP_CC_MISC_CMD, 0x10, 0x10);

Use clk_regs_configure() callback to set this bit.

> 
> Do I just keep the regmap references in this probe function and just
> move the clk_lucid_ole_pll_configure & qcom_branch_set_clk_en to the
> config struct?
> 
> And similar for gcc, I can move the qcom_branch_set_clk_en calls there
> but the qcom_cc_register_rcg_dfs needs to be kept.

Would you mind extnding struct qcom_cc_desc with args to call
qcom_cc_register_rcg_dfs() and call it from qcom_cc_really_probe()?

> 
> Does that sound okay, or what exactly is the desired outcome of the
> requested changes?
> 
> Regards
> Luca
> 
> >
> >>
> >> Konrad
> 

-- 
With best wishes
Dmitry
