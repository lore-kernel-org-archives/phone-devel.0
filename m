Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDBB0363C40
	for <phone-devel@vger.kernel.org>; Sun, 18 Oct 2026 23:45:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792367139; cv=none; b=riEKAOuADTmnwEOdE7gfGM4KMyqR7cSAhCCEKbvZ7axFj6M5bYKJNNrQdtrGcewVD7WnvqMWgyHiqoaJfIvLkCsrzXwPG4Wc1TVrogWou6+Li6+LoN9CeRPprAKkAuLHiP0fKhg5VlwcMaU7aqUgC+iyYB0/RfQeTfi1aZY901U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792367139; c=relaxed/simple;
	bh=1AvYdMYtd/1ZKZbYLP62bFavrHWwuuMlQPw11R6NvWQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qSF+zuG/pCoN4ca/OgE5xIpv68Iw+GARzKczUhtEsS0wPpyWKl9HlRVEw6jXN1hftNNg+RZoRLJ+2wLTBxtfLnYMSjjZOYHM0q4mmTbiiT1KWwdwAYxC51U8Qsky0CBhksXrJG5WNFfj8wRMvqaZ7sHJ0BJn5X33yHz4pFzmRs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RKdAVw1I; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Zdu35Q4E; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RKdAVw1I";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Zdu35Q4E"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69ILjDIo1401505
	for <phone-devel@vger.kernel.org>; Sun, 18 Oct 2026 23:45:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ODWpiVcrxaQUpUrVswJKsFz7HW401KcA0InWn1FGZl0=; b=RKdAVw1Iw9gQ6IS6
	yRuujisja+F734Qi4hF4ZMpka99CH+9RWkZ9DI44WM4nW3kmTZSYsrFvtxjTSOeW
	aFX/WWo/3qpR6NTI/IWBxO0MQn5Mf8qU1+gxOYFLIzFAIPu+T3vjmQFSJf4E8tcE
	5XS+9Qb5amkXYOrJ+PXWgaqvwpQyHKyCAl4u+SazY+zd/B0IuXsHDQchJQnrp2/W
	4icKBA3xcAm1kDXXXl2RpeWkuv66HFQhhEuySvHjii7bfnT9QGCHu6OFZMj5SpaR
	2TSwL9xCknfbc+1Q99EG+32Y5z5Lh/dyMBK3KD0Kb6H5ef8fSeZxD0H3yo3KElc0
	HIvDvQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hc0kxm7u7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Sun, 18 Oct 2026 23:45:36 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-91430af782dso54825886d6.2
        for <phone-devel@vger.kernel.org>; Sun, 18 Oct 2026 16:45:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792367136; x=1792971936; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ODWpiVcrxaQUpUrVswJKsFz7HW401KcA0InWn1FGZl0=;
        b=Zdu35Q4EeSYLnOEt//fW9gLCNu4zS2IWwisbZR1KInOhHPbYDmjB8cqKXNx6Ga55oZ
         ETaDRnuxeorOizWKySysStQxwwb1Bbf0jqbAKfcdUhMa7496gGspcR404+xhK4XOLREu
         +niDlGGjDn3cLzAgoYES4BidH/Cw7bScjy+hQD3DBZkMQ3vI1RdYBvZtg9WbP7b5dKko
         RewdStQttLQi8WnoCqsGbrtEuMmYJaihNoYcl5ArbCB4In6ImDmrb/ERYCFCCE/S0tC9
         gNr6EEWHZ5CWt1eRa5wlFFS606+fq80WhCegRYEowuikDMXeXynFzpSEMXaTq44CX19/
         1GSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792367136; x=1792971936;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ODWpiVcrxaQUpUrVswJKsFz7HW401KcA0InWn1FGZl0=;
        b=MEfoiKsR08h9iPGCGy/PdGKSP0GqES4JEvshzSOP6tlxXI0JXYceaRYm2h5M4Rx2wj
         Vdwe6JAVBL882PPcl7y5Fp3KSVS1tNIoseIJuRrWrErcC5biN33IvLo5OxqwnwdI8UFr
         0yxRfEojc8+6y0IoWL/bSPHLk6r1ZFHifyzHIZy1wpxDLD49V9RPpDVXO+g+A0UzU1U4
         br1DvmEOl3ZPF/M6V1J8y1zkPUTxqefx/xvuoCIXN1UcXaSW6kFZyxdKE0Z7XgG4co6K
         InCwIqFTQ2KY31fiqIJj7hvw7fAb7/0cfZ5MNTW77dLO6FWyej9jeR/cZ3Xv+UlyscXB
         Ydeg==
X-Forwarded-Encrypted: i=1; AKwUvBwue6bSISM3wEG1qO4shksGIbaoIE9EMt1hxNJuo1ETgpgTfyq4tyJLJ9+sJjHO23WV7xAQa3vQEgwItw==@vger.kernel.org
X-Gm-Message-State: AFq9FYL8iFlBWM9RW482CfdtTWLq1pGlt6IHTY0Flpy3gR0NJTVS8zDF
	xmPq2VHOWXEASVMPiH3wXwpTUyWiC85oRx10gT/gTOCAOQp2hUuOZAs9i/9g5YIuwfdFGFYe3O0
	4qAndRQGldUaqUqf+uMCkai+uYk70l0zv9iK1UnUa7gZ7zclCASYnfpaDW0jf+5rX9A==
X-Gm-Gg: AYBFou1rA+K7YYr3bVAFjrx/+4IXsBrTfbjKenDQytNIsnfuakDo1zj/pdQ+TrxEHFe
	Rq0oa5+KoK5N+aChIIERxUazmkmBWMpFB5wQaxPQ2r2yQkDp/SJJ4xjT6ZP9mykQP8kHGG/yF3j
	ilLwCfn24zd7hQfGCvJNKVBEnEJVIx3KlGOLMExIsqLWivVR8VfXDyBYGoGN9WiUOtb5Z8KkQ5B
	w6K1ywem7qpSSfMcNBd7uknXHGq6X+7/5w8oMjjP6W6WQtllPQDsvq8dac/XmSMPUNRYSSr0OXU
	KWGJ8H2OuPqtQl5c5vn40Ir1ixZN+ykZkr9OJkvkFdUs5udG1ygGrP4Z/UmtnKeUqyWHFMCAoB3
	BmLUwme9W5xGuxmugV7lhkFPgswwcfzSe15sH396jrDpO6Gxqm7dlCHzbBt9wYIQScvlW9g7y+E
	T2jpm4zB47kZgb
X-Received: by 2002:a05:620a:25d4:b0:93f:12d4:67cb with SMTP id af79cd13be357-93f29e0edf8mr1014972985a.80.1792367135997;
        Sun, 18 Oct 2026 16:45:35 -0700 (PDT)
X-Received: by 2002:a05:620a:25d4:b0:93f:12d4:67cb with SMTP id af79cd13be357-93f29e0edf8mr1014969985a.80.1792367135493;
        Sun, 18 Oct 2026 16:45:35 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ab3c2ed29csm6188191fa.11.2026.10.18.16.45.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 16:45:33 -0700 (PDT)
Date: Mon, 19 Oct 2026 02:45:30 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: David Heidelberg <david@ixit.cz>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Alexey Minnekhanov <alexeymin@minlexx.ru>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Lee Jones <lee@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        phone-devel@vger.kernel.org, mfd@lists.linux.dev
Subject: Re: [PATCH RFC 06/12] usb: typec: qcom: Add gen1 Type-C port support
Message-ID: <lbi4udyoro3757veeshhm2ou7ocx4ykwr444ljdpx6na7vjrlv@ud7z6vk7ggmm>
References: <20260926-typec-v1-0-31adc19f32c6@ixit.cz>
 <20260926-typec-v1-6-31adc19f32c6@ixit.cz>
 <4f089c98-a479-45c9-9b11-0207c895367a@linaro.org>
 <391498ea-51f1-4390-b84a-d0d738ec409d@ixit.cz>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <391498ea-51f1-4390-b84a-d0d738ec409d@ixit.cz>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE4MDA5NCBTYWx0ZWRfX0HVw31cT9uO8
 4XFQvhMyD7cDQ249XSeBveXWMfSxwAcvGgVYdaJD3vtCh8YeqNkHRKFKr40BlbdUQeBXPt+UH9L
 6tRxVWmiLwRPgpN6gxXmLY/ts4YjbQ4=
X-Authority-Analysis: v=2.4 cv=JpZkP84C c=1 sm=1 tr=0 ts=6ad55a20 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=6bO6gSLE2J104ocR4bEA:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE4MDA5NCBTYWx0ZWRfX+RYHMXDiqfyl
 XMPnRsHvP+POc8jQDL4NV6knd4t/jFalbEBEH2LGutDheLUrip/3Ztco2Oql4awxujdyHftFSTp
 WQeQKY9rSNA22bFkyWh1TjN6xaDOEZBc8GKI2J+gwI2CjsmtmAXF7C/mMKgHusknh4HSwp3Xl6E
 Vg2HXHSD9RapTMbL9fxKpLMGxzbe8lm63M6dUvg/TNizU8qSgQF24m0aChP35TkVsp6IjpckNML
 EZiXg2hm7ahqrAcfBFZv0HJDflT6KuVpACEPgnOdBaJd7A/jrKxqyvYpj+krBMTJzGtveYExif1
 TUQAiqWymwrdI4ddyTdtjgfo+Ju3YaIWwA9GA+QQ6qNov0NFSI/yr3Es0JcAMX8Mf+AhXoIUxQV
 DL9/PnqYBicQkg+F1NK5WD1SCb500YoWSCHBFRoXt+knkAXUrcvvb5QOYCKFpnw+4XZS5A0wc2y
 wmegbYGqO1PJtKDI/nw==
X-Proofpoint-ORIG-GUID: 3Tbj9PVbi7wKahoIFocHrG_rTqDnStou
X-Proofpoint-GUID: 3Tbj9PVbi7wKahoIFocHrG_rTqDnStou
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-18_05,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610180094

On Mon, Oct 19, 2026 at 01:29:53AM +0200, David Heidelberg wrote:
> On 26/09/2026 16:22, Bryan O'Donoghue wrote:
> > On 26/09/2026 13:40, David Heidelberg via B4 Relay wrote:
> > > From: David Heidelberg <david@ixit.cz>
> > > 
> > > Add a port backend for the first generation of the Qualcomm PMIC Type-C
> > > block, found on PM660 and PMI8998.
> > > 
> > > On gen1 the Type-C CC logic is part of the charger's USBIN peripheral
> > > (base 0x1300) instead of the standalone Type-C peripheral used by
> > > PM8150B and later PMICs. All Type-C events (CC state change,
> > > tCCDebounce done, VBUS change and error) are signalled through a single
> > > aggregate "type-c-change" interrupt, the handler re-reads TYPEC_STATUS_4
> > > to find out what changed. The PD PHY is register compatible with PM8150B
> > > and is reused as is.
> > > 
> > > Differences to the PM8150B backend:
> > >   - get_cc() returns -EBUSY until the hardware reports tCCDebounce done,
> > >     instead of using a software debounce.
> > >   - As a source, only the default and 1.5A Rp can be advertised, 3.0A
> > >     requests are advertised as 1.5A.
> > >   - The PBS workaround of the downstream SMB2 driver (TM_IO_DTEST4_SEL)
> > >     is applied on every power role change.
> > > 
> > > VBUS sourcing is optional and only used when the connector provides
> > > a vbus-supply, as the charger doesn't expose a VBUS regulator yet.


> > >   static const struct of_device_id qcom_pmic_typec_table[] = {
> > > +    { .compatible = "qcom,pm660-typec", .data = &gen1_typec_res },
> > >       { .compatible = "qcom,pm8150b-typec", .data = &pm8150b_typec_res },
> > >       { .compatible = "qcom,pmi632-typec", .data = &pmi632_typec_res },
> > > +    { .compatible = "qcom,pmi8998-typec", .data = &gen1_typec_res },
> > 
> > I think this should be
> > 
> >  > +    { .compatible = "qcom,pm660-typec", .data = &pm660_typec_res },
> >  >       { .compatible = "qcom,pm8150b-typec", .data = &pm8150b_typec_res },
> >  >       { .compatible = "qcom,pmi632-typec", .data = &pmi632_typec_res },
> >  > +    { .compatible = "qcom,pmi8998-typec", .data = &pmi8998_typec_res },
> > 
> > Since I'm not sure "gen1" is a real thing and besides, I see this
> > gen1/gen2/gen3 stuff in CAMSS and it means almost nothing. The silicon
> > version is the salient thing.
> 
> Best I can do is GenZ.
> But now seriously, I hoped someone from Qualcomm will chime in and tells me
> how is this type-c block generation properly called.

Just use PMIC name, please. It's the easiest and the simplest option.

-- 
With best wishes
Dmitry
