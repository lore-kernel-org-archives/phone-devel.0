Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84BF02FFDE1
	for <phone-devel@vger.kernel.org>; Sun, 29 Mar 2026 10:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774779130; cv=none; b=kTSr+0rbl7Wfso0FRtlOsZA1ECzLTq8sf/xa1/OlPyJu/FIRIRv5lzGJ+89qSB+40+AnW4COBAuckwXZOuWmZInAFBHxBQqp9sTqnQtOv1/BXBqH0buBD1aW6qrpCndpm1OReEL7ENQwbmy3w3yvlnrrnnQAobXR4RGzUHJj/So=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774779130; c=relaxed/simple;
	bh=dTsHauF+acSw2UdratfwITblpItoGJWz/NTU8kZd8Tk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V3Wk8Rnvtsa0LZ40Cj36q37YRHtA6PrCsWyci6swHZU810rMy0rfJflyx05oZiwCq8b1IXdqPqim+c4v8+9zxGshFEbcXpkuDK7cO8amjoSaKGsbqbgloDBbgI9ODzInV3/SpecbyP2GSeGuCBWLyj/QwZ21WlwIrKXhc+VPFvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bDdB0hyO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XglhH3Bq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bDdB0hyO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XglhH3Bq"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62T5Cj432292267
	for <phone-devel@vger.kernel.org>; Sun, 29 Mar 2026 10:12:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=qcamN5b4r83psLd3XWUhDk/8
	Hm8gMoREH44LLVdVMo8=; b=bDdB0hyOPIfAI4NHVMaqK0JQBinty95zlRNWsiZE
	d13UnfXiyROzhzQOjpb28Y/7YVOAVVfLRqeyGzZwG151eCPQTo+Ngur5HYFPITCl
	EX0phWmKFtMeIzRMKSzfLbpz/v3aujEMBw81KbwbiWSfrrLPiYMVZr3CRezvwG0j
	uZdQkTm6U61k5x1079IIhMu9RBIiZ9XBhmtpFO4gDGOMGToUEy9XxePKWtZCPmuM
	OZnV1PCOU5WtA/qTk7g7gAu0y4uNZvufV3ySx70EL4BCKV3mkTJ/n3vayy3PF94R
	+/I6WmrwB3f1dQR79dkbYlKxjHY3WPbkWRX+dC4JrqAwUQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d6wqegcsx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Sun, 29 Mar 2026 10:12:08 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b4b81c632so114641921cf.1
        for <phone-devel@vger.kernel.org>; Sun, 29 Mar 2026 03:12:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774779128; x=1775383928; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qcamN5b4r83psLd3XWUhDk/8Hm8gMoREH44LLVdVMo8=;
        b=XglhH3BqG3tVkbr4abF81ucif7kRvGpI7advNR4GrtPHQoVtKi0+Z8Uiwp07oy6S3h
         wYAlPo8XmWJzD40Igs4PR+2S8TNg1snsXmrVZq+XdiOSUsdLjcL+ekl8iShx6eUDq95b
         +QoLwIgdLb7Z+MkKR1hGyewNjqPWMcZ6y0ujwjRrNerXu6GBYMSbRDqAyQ4o11qwUsmu
         I9JTJXJzypJyx7UknsQCodwrZrwdSMEltrtfkrsxQn5Z7UtrUe+dBqeCPUjMw2uuQhpw
         TcSGXoKj4HaPHdXvxlZ+AKSrSZNJVqXRy+cP/eZmjZTOGl96FhulkfX1Bk6ltibFdz1E
         HxNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774779128; x=1775383928;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qcamN5b4r83psLd3XWUhDk/8Hm8gMoREH44LLVdVMo8=;
        b=rHSS1ZbyWN20KU2aUXYhjuSipAigc5IMRsJuogw1FMJ9+H5oUrDTvYJ7PsVJ4bBjtT
         VByMyjDAPlodhijxw6Mm7t5mmqa3yk0e/3qaG7UUIjM8qc7eOmmyVgoNrbbIzQLYntxh
         XqCeVN/h+srmrKLd7kwowDGWiKdH3cuSvG5Y5ewOtODd0rxpjdTfFFegJnjj4bS+XvJY
         k/rP/fj3UfHjeh6zTagJF+YWiRka6d9vi+p6kMU/TzJbFrns4tozFGbnnRQPvj6tL7gP
         l8n+a+x4ORq57jgtdVSojgguZBg6YfRT00UTu3XRPv7pQUFNQKiT8zE19K8U3OvWzfWX
         sKqw==
X-Forwarded-Encrypted: i=1; AJvYcCV/kr6XaHHYiN7/FTpgFijRTvlVCJOrlilD9nwZtUQfL4l6Aem5bXjdETCOR3pDeauDkFB8TZW23BU3vA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzPgqtAZFWF8AtGtAO8L7l9FTivQut0c+yvxVqVxekZBl3aKM4C
	Y1SbxbGgqmJ676/C2ny5fcOL+1owE3t2MJOPFNm6vfD0yyPa/CODUNynD26bl4MriNAcDU9cet/
	NL5lEYQX7Ej4VkQYwXX7a4lKhAxG9OhGz1goYclEPbCYbZquEVbZdP6d4d3r/DFd+wQ==
X-Gm-Gg: ATEYQzzdYB58wVigf7fbK8XBbAU/d7naJEovNRvq+piTr19Msx7AXaVOp8xvnVr2gSU
	HkCPzrFx89431EVPjF7uwx4dK9rk1CBD35iPgFwY4DjTJ6LleIBTPxvX2FoNZcX8mXjPvhWGr2S
	FlZdIK8tAa3inL94Aa+ljIZEcaPsyu5cz7+tNbWOvS8gdTYjveOwvaf4eK8pWUW/tHsOP+yYk+i
	RBMot2p9SEDio5frebdkGeoyBftuJG+xYxGOcgHMSbInSSNRfLvsV8O2tUkvpgEFGq2fEidDA1l
	Ealzq2xVPINYAH/S1vR0hSPsOi0WhgswfMcCkZBWoNIPYrlB+fR8DWR57bfon4zh9jiaDhjSa8/
	XNYM9pBgQcESRjK2YRY32a7btdoht707t3n3LLPHPtEEWHuNoLiPqblTeWpDyPY+taijE3gPHwQ
	GSeBcpbwPD1sSPXPAFBA0YRXgEdZlwRoIXJbY=
X-Received: by 2002:a05:622a:1a93:b0:50b:532c:2ab4 with SMTP id d75a77b69052e-50ba380a52cmr118052331cf.12.1774779127730;
        Sun, 29 Mar 2026 03:12:07 -0700 (PDT)
X-Received: by 2002:a05:622a:1a93:b0:50b:532c:2ab4 with SMTP id d75a77b69052e-50ba380a52cmr118052051cf.12.1774779127248;
        Sun, 29 Mar 2026 03:12:07 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38c8389524esm8614521fa.21.2026.03.29.03.12.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 03:12:05 -0700 (PDT)
Date: Sun, 29 Mar 2026 13:12:03 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: cristian_ci <cristian_ci@protonmail.com>
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
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
Subject: Re: [PATCH v4 3/6] arm64: dts: qcom: msm8953-flipkart-rimob: Enable
 display and GPU
Message-ID: <o2sbqzcix74u46g74sil2c3b6mgd6zsrmafesoqltfbbrzqhjh@uochk3so46yx>
References: <20260327-rimob-new-features-v4-0-06edff9c4509@protonmail.com>
 <20260327-rimob-new-features-v4-3-06edff9c4509@protonmail.com>
 <us3ps4bgf5ekk2iudcgs2wa4b5qd4mzokec4q55pmhb6kvt6ht@qm4mmzdai2t2>
 <O7THc5h8ZhgzNpklYKTGOnEZKlN4BtHZHjKZt2KErekNb3E-hizt2dw7xuJ8G6giEyivmvC0f6-eIfCT6fJkUA7_CVQwhAktCXfBqAVV_Zo=@protonmail.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <O7THc5h8ZhgzNpklYKTGOnEZKlN4BtHZHjKZt2KErekNb3E-hizt2dw7xuJ8G6giEyivmvC0f6-eIfCT6fJkUA7_CVQwhAktCXfBqAVV_Zo=@protonmail.com>
X-Authority-Analysis: v=2.4 cv=Jo78bc4C c=1 sm=1 tr=0 ts=69c8faf8 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=sfOm8-O8AAAA:8 a=BrrjAlgp8CM1T73XSN8A:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22 a=TvTJqdcANYtsRzA46cdi:22
X-Proofpoint-GUID: ZffxRLbdJvVBLDov5z0hnb87sj8dNjdl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI5MDA3NyBTYWx0ZWRfX61Mun/55KDdc
 qPMgGuIaQen48HikESe42kuj41FWHysuvDJ5vrhCqM+kFUAGwnQqZmiJKwnJ4IGRpOMJt4S01cQ
 A1UJTUWzT+44xVoR1u7w9N/c05cplFpV05251GcxONNBX/jeFIQ5XVh/izwUVjycOrYLvVki/Gl
 K/CzOrWZmxQnSmw5iZpojxFWovesee2GcJMZnnZFml7UWzrndm1JWhKxNFeLQWOhCbhCC1UCFri
 MTXPXcXdIwvnkj/SPdL5EgKrB0eoFr1rTEdwxrXJll+jlnpU/wJSblLYyYTypHaNn+ej42/UpHv
 pUe0RpqBC16M17OD36TAbxJH0n29RXVx5fYedK3goVFSs08xRkK0/l7OWVVjSGYlnADvzyb+K6U
 Aw20FVQCppYO75RDKku6nGWxCpjbnMRAxYaeC5wYa3NdAqhuc5oybkBteQgu9zlzSiHSl8V4LVe
 ai+nywTeHxZc6IN6qNA==
X-Proofpoint-ORIG-GUID: ZffxRLbdJvVBLDov5z0hnb87sj8dNjdl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_02,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603290077

On Sat, Mar 28, 2026 at 05:30:53PM +0000, cristian_ci wrote:
> On Friday, March 27th, 2026 at 23:57, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> wrote:
> 
> > On Fri, Mar 27, 2026 at 03:30:49PM +0100, Cristian Cozzolino via B4 Relay wrote:
> > > From: Cristian Cozzolino <cristian_ci@protonmail.com>
> > >
> > > Add the description for the display panel found on this phone.
> > > And with this done we can also enable the GPU and set the zap shader
> > > firmware path.
> > >
> > > Signed-off-by: Cristian Cozzolino <cristian_ci@protonmail.com>
> > > ---
> > >  .../arm64/boot/dts/qcom/msm8953-flipkart-rimob.dts | 73 ++++++++++++++++++++++
> > >  1 file changed, 73 insertions(+)
> > >
> > 
> > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> 
> I wonder if I should, instead, edit the compatible property by adding a 
> second string (for the fallback), like this:
> 
> compatible = "flipkart,rimob-panel-nt35532-cs", "novatek,nt35532";
> 
> and, therefore, add "novatek,nt35532" string also to (patch 1/6)'s 
> bindings example. Let me know what you think.

What would it mean? I think we usually don't include the IC into the
compat list for the panel, but feel free to prove me wrong.


-- 
With best wishes
Dmitry
