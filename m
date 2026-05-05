Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9560125A655
	for <phone-devel@vger.kernel.org>; Tue,  5 May 2026 12:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777985146; cv=none; b=UJYaLqtEQJXWWbNd0Wmc7WQtKVQeolp2sqH2FB8id3rG0fRMqR1YgWEU1XTEKVA7LMuc0ujZuBUmk937NAv30d0uARtNxwZnnTDvPg/xUvcf63mfoDNmlqhMJ+qdEFnYG2X4XQMfK0za7mGIKYySzO3ZpGFXcw9d0bVKqwhtVFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777985146; c=relaxed/simple;
	bh=CEyLqAyk/8XZ4kbIg6O5FriVbkWoKwTJ2mt4+nOD4pU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Dapsx7PsNn1nSsBWtgrE+3IhPDatgKy3WNx3/X34mJlYAG/UU/13Uzu6AkUhvq8//qvdhXo5XgeYPYjsb5P6yBQxNgJX5AANrygCoYqtSZGdusaIepZWzDBG/TnULWIxT1F9wZB9AAfPXFHVh09vFHiX6lOZzkh7HW4mDtNgurk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dHGmGxZm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PbJj+5dD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dHGmGxZm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PbJj+5dD"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6456liUP3187556
	for <phone-devel@vger.kernel.org>; Tue, 5 May 2026 12:45:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=rRe7fzW8DQ71/cGj/cijBCqJ
	qRhiTXRVLYdroRmMEqo=; b=dHGmGxZmiOshcuXXPHq5EUSBNAeM+v6KpaiPZIA+
	9Kx72YGRypaD8rrPSnQfUoNeEyGtQjzcMIcV7SIQjrwV5iaBatPyXrhSlVwtqiDK
	s88Vyft9gpSjY8ebwOcIguBI/viXmvZzaI3x1SGPIiiX71tc9SMHfaHoHVOpc0NH
	LqyYUQBzALGLkUDqGA7FMdiB+AdtLNXJWJdo34rPGBfNKunM+DF278Mb1+L6cvqc
	Ape7FtV9UBRgIIAs8Cu8DK9MwkJf3Ayy9K2oZhRq5tR8OD0Eo24QLN4+dEM+qNUC
	RdAWWIEscliqR7Th2422aWCw/fHO4l8SJZCZt3/8dkPZng==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dybkk9a3a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Tue, 05 May 2026 12:45:44 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50e575a50bcso70798281cf.0
        for <phone-devel@vger.kernel.org>; Tue, 05 May 2026 05:45:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777985144; x=1778589944; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rRe7fzW8DQ71/cGj/cijBCqJqRhiTXRVLYdroRmMEqo=;
        b=PbJj+5dDbpbpC4NhElBZkEbUBXxg5XwOu2K9yUCdC/TzXNvNi3HbVyQsweUeBWFp/m
         8/w59R6ZINh9qPGiQJejyXj9X+aSLX7/8Tb4gMk5fmjNDPa6+PWOcu/DlG80YwV2sO1z
         11MM1JmrEHL6otEKifu8L/M84hHZr1l9rJxUEKqvlTA/NYkOP+QcIEXXjbQV6PyTNU+7
         +p9zQBIUAlBjbeIrp2HIC2gE+uBLW3bqZ+Db/q00eyNEPqRkHmHyCL2skpX5geRylxTE
         QKSVknn9WpkSdBWGj2A7Gek3qLyD41Y3J4W80IGvfKqAY8G/alGke99zmI61czT80b+O
         AnxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777985144; x=1778589944;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rRe7fzW8DQ71/cGj/cijBCqJqRhiTXRVLYdroRmMEqo=;
        b=cIjsU4QOqgjAHuPslEFWGz8AG2LdhE3hmB1WU3KQDfZoZ3qGBMvy5yTNvJ4M8RumJE
         SlMVyunof50R71zmuBiP6HFRO5LPMvsqckAYPQZ/AB28uruhHGh+cFlG5TASEPoVqiJm
         qWB6SpLs4sO4HEIqbrGFp3abZxnvCwrrZ7SS4vAuDNrMHgW64HgQFZ9H0mt4d7ypQKkT
         cuF+547T7oHlwkyoT22wObcb3uTzMOLaYqsdpRHyKo89lSAhntLfq9mjnW58eGQ7QIqf
         vKjCbb/IB6bJkBGZDSxF/gpOVT2RKCC9oX3hXZnR+FE3cm/7BQk5dbyA0f4Tt7MflCQB
         I97w==
X-Forwarded-Encrypted: i=1; AFNElJ97v7SgMliMFa00+08DtjrPwLXtIlFV2d2UVFdO5E8LTu4Ol9yWlsue2vpNcpnfZv9ndGEzre4kSzAcew==@vger.kernel.org
X-Gm-Message-State: AOJu0YyDlM2aBGfmxi1WUt5Em7ZDjpGvRF5DNUNKKBBToioG7mx6yYKh
	hJeQVa96xsxJR+oQCxpY+ntXmIZ16g3Z+iLiuEs+IjoiFR8Dl9gFDzzybpO+Wl07dacSc+rK+ys
	mq3x6PYh5rmusunB22MB6eUkXmyYEq97YyZTl3YQwW8PuQ9Hw0T5Ss14H8LpqZ56j/Q==
X-Gm-Gg: AeBDieuB2aAigDwGiXTlHlC3JRMC/1mD5PuaRc9BY0uDBt01X0u0Hm5a+Ww2gpEM3tA
	H2Dwzkj++7G+ckjF/R6WEvS6p4tTQWUMxgJnqXpB36jvXeuYyioglBKhqCdAlk+GNkrZC4lu1nb
	ozxhSQlrkbpL77GwutWN14cdfyGYAMDWwggy3z6EXHCvUKyePfDTRSfrBXRThMtyVWXUsIpM3gd
	Zi0VhGE8rhdP8l//OdRNZQ04jSaMIDAeoYMu+lyVlcK7JsV3kYDFVNrHzH4FnS5ZFiqHsG3PxJ5
	gzuB+LL4lm+HxF6pOCevVnE4rJPMEyUGpNWjiTBjKY3YX6Kl2ZCzcYG5JiVvQfsnuB/mZTiiRK3
	Uw8e204uwDrls9KGde3QzyjCmAWTo89sgr05Il2try5bW3SjKhuqDn4aqCYLvssIm4NsKQGbZcL
	kMXED8MH5sVDfWqJ5W7+NF8ZQITSlMOrhaKUYe5oAu9YQ1Bg==
X-Received: by 2002:ac8:5796:0:b0:50d:97e8:939b with SMTP id d75a77b69052e-5104bf98b3fmr196771161cf.36.1777985143068;
        Tue, 05 May 2026 05:45:43 -0700 (PDT)
X-Received: by 2002:ac8:5796:0:b0:50d:97e8:939b with SMTP id d75a77b69052e-5104bf98b3fmr196768301cf.36.1777985140468;
        Tue, 05 May 2026 05:45:40 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a85c230e00sm3867561e87.29.2026.05.05.05.45.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 05:45:39 -0700 (PDT)
Date: Tue, 5 May 2026 15:45:37 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: cristian_ci@protonmail.com
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v5 5/6] arm64: dts: qcom: msm8953-flipkart-rimob: Enable
 touchscreen
Message-ID: <hsisxgvzte5h3zuobmrjdx4uasan4urj5xbes2flxdq5cakygx@ok3rhermb2hw>
References: <20260331-rimob-new-features-v5-0-5fcf42a29c12@protonmail.com>
 <20260331-rimob-new-features-v5-5-5fcf42a29c12@protonmail.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260331-rimob-new-features-v5-5-5fcf42a29c12@protonmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDEyMSBTYWx0ZWRfXxN3Zbgg6ePJO
 OCkzHYbYOqQ7is/rD0WzTrHzfVq98+fgzuD2/lz2U8jX5HOQ9/KKJXVlKSJAKfypHLpr7C0WjAw
 nXQXIfPw6w58k1/HnXHP1WjZ+4eQ4jdA2KjRN6NHkDArOPno1wbaEnkWqFhB2dX/MayHoo2W8Ue
 DhkKALGSMCMio5f4zyIlXczSwHyVN+SwtKa1M93midMo5Bp0/Iqw2gL8vSrBjuIGUrQH5fVHlgy
 Y5c59wvaWqoXyXZuRTCsELTSu4hmxFM6oMTT4PEPThMwFjAn2afvGVpaOEHwx1lUSAIpOVdqv3Z
 HO68Ift8SOyoKmfEj1k+eztKLAcWPrdQQFgv0xNFiuYkSHgVy6To8nMW3k/YiTvXQ0jGbM3sM/R
 zD97gqG/rSozujxFNl6Dw01+HUsWBGO/UGTHSdtWfEq3AN5w2jacToYJ9x0qKNdNO0ac+cVsnli
 2IrtWFruGHnO05iZOvA==
X-Authority-Analysis: v=2.4 cv=SPBykuvH c=1 sm=1 tr=0 ts=69f9e678 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=sfOm8-O8AAAA:8
 a=EUspDBNiAAAA:8 a=FcDylz7_6oNKbyFHn_0A:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22 a=TvTJqdcANYtsRzA46cdi:22
X-Proofpoint-GUID: WAV8S7sm0PygJbPpIOEUrTHdXFehc1-G
X-Proofpoint-ORIG-GUID: WAV8S7sm0PygJbPpIOEUrTHdXFehc1-G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 bulkscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605050121

On Tue, Mar 31, 2026 at 11:47:13AM +0200, Cristian Cozzolino via B4 Relay wrote:
> From: Cristian Cozzolino <cristian_ci@protonmail.com>
> 
> This device uses a Goodix GT5688 touch controller, connected to i2c_3.
> Add it to the device tree.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Cristian Cozzolino <cristian_ci@protonmail.com>
> ---
>  .../arm64/boot/dts/qcom/msm8953-flipkart-rimob.dts | 32 ++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
