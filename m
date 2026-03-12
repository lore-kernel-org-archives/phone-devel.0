Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1926826CE05
	for <phone-devel@vger.kernel.org>; Thu, 12 Mar 2026 15:19:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773328783; cv=none; b=KwhedQGCh/MsrMLFbS7xD/XYh6m51Y3bx6NcItwJMRun+oMQGaDvkD1YeLIWt1jbcT/7uFrDC2w5ucNFKVzXwtr4MuTNR6tsF9aNkcmfFRCcYZL4vq95azoXk1j12YJR9Jy8L3H0u1kA4ZDvNZ30XJIdtfGBTZ4vGZnhme4idYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773328783; c=relaxed/simple;
	bh=Yjj3Zdg4KSzC/NI1xTNy20Pukn7725BLIZPNSgpUQoo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qKtr/diDizHrGcldFVHDghfvwNLF+qLAXPkWLIKmDaKv0S974NroVzdNsjvIGJ4cmbXZd6TQZzXR2EflXcsessb0NcnpeDq81bcI52aWOMmKrMGuRs8inYOziKgPzfVcLyR42FGGHsgJp9sNT5zw2plmOzFvpyGj1FjEoxmvh6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Eka4Audy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MO5PAuuj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Eka4Audy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MO5PAuuj"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62C9QH6O4132440
	for <phone-devel@vger.kernel.org>; Thu, 12 Mar 2026 15:19:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=VicwKrZmXauWaaAzXToOjmF+
	1QwCRXO2GFnrYbGK/Gw=; b=Eka4Audy7N4zQ9bCSVYPmZlv0l0Rw1/RuuiAH5MP
	WVVS7UeN3FlS+qWXiEttoM0+8txpDKVvnf5rZ06xbs2uN6PWWxtRillg15owqk7I
	G26Oy856J01JqP+50hU3OnDjrF6UVf7va1ofWX6xqeeDUk55+32uUPgpFARFct5r
	xQIpc/MvEEepFesJ1/ivytllqkg79vcXuKdMwTET5X/3XojMW/NFwUYflgXr2zBm
	1soq7+/StY4B4drTIQIfciSWdNBSU9KRTpNZLO/z4NmhTatchLN6FDuXyxBy1yGK
	jUvoZJIvJ6mNjww5xheLK+OfPgEPdhMrhDOAar59FxIQlA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cuh4w2hq5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Thu, 12 Mar 2026 15:19:41 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cd820c6a4fso963416385a.2
        for <phone-devel@vger.kernel.org>; Thu, 12 Mar 2026 08:19:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773328780; x=1773933580; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VicwKrZmXauWaaAzXToOjmF+1QwCRXO2GFnrYbGK/Gw=;
        b=MO5PAuujZeT/X8IAnEj3zC++MpbCa8PkamSoinJoPGp33n/5aphw1FtD4e2A9cIXsg
         Zgk8zYeeIfg7PvFE146KWGWgXFrwzW6gVRMIzGvkFPCXoQIQN2hDupipiPjHY6gDNmKS
         FMZM+yZPHH7wrQtE4tc+rG4+VKp9fdRGBJAVxkvfUo9NL+mWnqh0NLH5ECiZdPMffwYe
         kJXOU7qZ55/fMl+Qk463dQcoxgAg+P1tVWGCZBghvfHbzXVqEJe1xm8nmqlxaS9A/Gts
         ieR2BjSua1YnKsltfQqOE5GCxQuQv+06S8PAYLXX3f3ztQmGGefbF+NV/Fau9+LzAInV
         3VCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773328780; x=1773933580;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VicwKrZmXauWaaAzXToOjmF+1QwCRXO2GFnrYbGK/Gw=;
        b=qiVXBxVcQjIF4X2ThDK46TdfNTBjcRHPxGHofmsvhQCJjmiaCrMTKVLTsdIMLLNQx1
         wyXy12AxAuMgywdzmaV6TV74gs2oDS7D+UnQXMm+WMQvk1dIU7vCDz39FzuFg6pVHUW+
         c1CK5gidzB+OHkGOOfSabtdXa36Qkc9TpMLQvzkw3yNg2oQLBKo8yo8s1HvGS2DNQxYI
         BJw5jXIa/6ijGb2C4zjSms+/rJswmOTLmWTbhYw/8FYFPC0+lA70ZKT8u6hIl9OUME+o
         3/x5tdajBxyhPoz6wdMyBmPMlrQieyQ/keWwSfGyl1AB3IHIMkJ94w6AH1tOgjuXPseW
         +wXw==
X-Forwarded-Encrypted: i=1; AJvYcCXpOFYSQ4g8dOghhyWA3COFUKxUQNYBB+x0B6EadXNT5FDbWBOh9l16+HZEMxdWhEO8SBSkaINps/jp0Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxP3QMWLIXreKpZWS4EwCpVhlw6r3gq3qkik6BV630I3hIbt3cQ
	pLrzvaIrJJj0kmsk5lOvemslzc31/AW0Pl7+IBGGUERv6rE0FsZIP1T5wrLFrjZln2Lschzw5S2
	9UFlqDSBbo5XF+56gx4zdkmVjbUoKIyhQQJv7XZlDOmmMu0TL3x/F8LurbAC8aS5+0g==
X-Gm-Gg: ATEYQzzLxoxHbq+mhZiAepgBkwz207bLDxFkslWRUnaKgYPBaWomkuHp1c0xiPuFSOj
	LVLHfrk4wSgM7jISNNodZdXlya4L1l6bj7NKPc6YSzTXQqKM30EGx1J8aPdgSURhPn9UiY8enxL
	0MieEVU2Mengu9vN2U6jl9XTRYwMfQt+PC28zyTwuo09fpzf8BcUh3mtBNXctXveycJ/M2Y9vlu
	jECePYqsL9pxOcXILMaJFGmbweqQwx76ZdGvByFmyAMvH6h1sH8KPzGQCv4FPHUwc3dQKQDo81P
	xu7cgTklFFhFKOMkG6NkApB45glGVF5wYxjBTBKfUVKTEaXfVKZepiiV0NiAgizgY3yHihyQzws
	fse7MhzHODAgovnPeMtYmKzNDv6KhGI8TwUftI+dXCQQwnFC214MNE1mda+9s+KUG2hLKEyrnbl
	jUjVBbxFzNzIewTMEphvq2KLlwV1xf5gmi9E4=
X-Received: by 2002:a05:620a:40c7:b0:8c7:1986:6b3e with SMTP id af79cd13be357-8cdb5a9e986mr12941185a.32.1773328779983;
        Thu, 12 Mar 2026 08:19:39 -0700 (PDT)
X-Received: by 2002:a05:620a:40c7:b0:8c7:1986:6b3e with SMTP id af79cd13be357-8cdb5a9e986mr12935585a.32.1773328779480;
        Thu, 12 Mar 2026 08:19:39 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a155f33cd4sm1003801e87.8.2026.03.12.08.19.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 08:19:38 -0700 (PDT)
Date: Thu, 12 Mar 2026 17:19:36 +0200
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
Subject: Re: [PATCH 2/6] drm/panel: Add driver for Novatek NT35532
Message-ID: <bvcaqyjoahkxvexjgra3zpwcc54xmo54gsyedg75cfweq3rutk@rckmxgjcyprq>
References: <20260308-rimob-new-features-v1-0-aa2c330572c0@protonmail.com>
 <20260308-rimob-new-features-v1-2-aa2c330572c0@protonmail.com>
 <kvq4py5svidg7c4tu2kxwpj6fnsod66kq555pwchd44nfdjejk@yvpk4ismso7r>
 <xftpHWQbO-34K0sCpyznwHTYxoNo1CMY1NyFzsDhEeM0s59S3Rqvu9tmdlEk6VAaxam3HVz3Bk7_7m10FEn3X-3Lc2HMVMxWUXkB-Olgt6Y=@protonmail.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <xftpHWQbO-34K0sCpyznwHTYxoNo1CMY1NyFzsDhEeM0s59S3Rqvu9tmdlEk6VAaxam3HVz3Bk7_7m10FEn3X-3Lc2HMVMxWUXkB-Olgt6Y=@protonmail.com>
X-Proofpoint-GUID: 6JjlH3SJuyTiynWdpauegm4RVggxacCl
X-Authority-Analysis: v=2.4 cv=Cpays34D c=1 sm=1 tr=0 ts=69b2d98d cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=sfOm8-O8AAAA:8 a=yFjy0gZ77y6Bn92TwrQA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=TvTJqdcANYtsRzA46cdi:22
X-Proofpoint-ORIG-GUID: 6JjlH3SJuyTiynWdpauegm4RVggxacCl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEyMDEyMSBTYWx0ZWRfX16clTGJ/+zFy
 6AnlRdMQ1xESwOYRCfQ61qkTrKm6D29b+zr+Nr13yzQODAa7dl9i/rLoHzTsQgamSjSsJJeiX0O
 RKJZHEDlBktHyrBSo1J46OnYGP7gl1EBA3MdgKr0ZBI1/Gd/NxZ6JvGBw7sL4T/CbYwTMSrgs3a
 6pR0A5XwcIgRqQu4QWrSy1A0Z+Tdl5J2uIvfNQGOD2yb6zO0ZO6tfzgwTlLztLidhNHgZazK9ZJ
 2BpraDlkdzf1J6IchR9e7rYpleHgc0HSLL0hyCbmnG4PFlBjfBWZ+fan5DlwOgLlPhRzifFlFIJ
 38EXwJIne9RFF3nyCwQqg+Eabr0z2AyEPMVguVlrHDP288ScOvc/WvYr5aLv9hmyglSROF0O+DZ
 LQHLV57ILYE9BwfW1GR3npAzszu7KRThrJxPajP2ZcEhvPPUjEgWPpiHBYHGiolGgg2xucFrAt5
 m/HgyuoalTGwTVmlx1Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-12_02,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 malwarescore=0 suspectscore=0 spamscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603120121

On Thu, Mar 12, 2026 at 08:27:33AM +0000, cristian_ci wrote:
> On Sunday, March 8th, 2026 at 20:27, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> wrote:
> 
> > On Sun, Mar 08, 2026 at 04:52:42PM +0100, Cristian Cozzolino via B4 Relay wrote:
> > > From: Cristian Cozzolino <cristian_ci@protonmail.com>
> > > +
> > > +static int nt35532_on(struct novatek_nt35532 *ctx)
> > > +{
> > > +	struct mipi_dsi_multi_context dsi_ctx = { .dsi = ctx->dsi };
> > > +
> > > +	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xff, 0x01);
> > > +	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0x6e, 0x80);
> > > +	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0x68, 0x13);
> > > +	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xfb, 0x01);
> > > +	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xff, 0x02);
> > 
> > If this goes to be resent for any reason, could you please insert an
> > empty line before 0xff, 0xNN wries?
> 
> Just to be sure about such request, should I add a blank line before:
> 
> 	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xff, 0x02);
> 
> , before:
> 
> 	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xff, 0x05);
> 
> , before:
> 
> 	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xff, 0x01);
> 
> and so on...?

Yes

> 
> > > +	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xfb, 0x01);
> > 
> > [...]
> > 
> > > +	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0x11, 0x00);
> > 
> > I suppose this is MIPI_DCS_EXIT_SLEEP_MODE,
> > 
> > > +	mipi_dsi_msleep(&dsi_ctx, 120);
> > > +	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0x29, 0x00);
> > 
> > MIPI_DCS_SET_DISPLAY_ON
> 
> I've done a double-check through NT35532 datasheet and 
> include/video/mipi_display.h: instruction codes match exactly 
> those mipi dcs command enum item names you've mentioned.
> So, would I have something like:
> 
> mipi_dsi_generic_write_seq_multi(&dsi_ctx, MIPI_DCS_EXIT_SLEEP_MODE, 0x00);
> 
> mipi_dsi_generic_write_seq_multi(&dsi_ctx, MIPI_DCS_SET_DISPLAY_ON, 0x00);
> 
> ?

Yes, thank you.

> 
> > > +	mipi_dsi_msleep(&dsi_ctx, 50);
> > > +
> > > +	return dsi_ctx.accum_err;
> > > +}
> > > +
> > 
> > --
> > With best wishes
> > Dmitry
> >

-- 
With best wishes
Dmitry
