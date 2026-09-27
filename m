Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B66841A4F9
	for <phone-devel@vger.kernel.org>; Sun, 27 Sep 2026 16:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790526823; cv=none; b=lEur0q8+XaRo1C6v8TvkSel3ClJseDnpXZ2CoWYbcpDk1nWAWQTSlRnmOCudfIvcqupkuhUaSY3DsWn/3A0jIilVhIUDRclPNYb1L7DwJN/OPUjeviOAtdPGaduI/KvAE613RAmu4DLZd1KisT7+/f5JSyGZb3+iHS6SB/Jftlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790526823; c=relaxed/simple;
	bh=xGlbAsXAOE8rH+2A5jMDhH2JAdQcuVK+CGw16Ag4g3w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fp1g3wAtKUDhhiKpvNoWAm6eG017b6Lhlgw/a2bok0MhSdXtRTfhg23yqYZlBCfpeLl6LTdFX5WkW87Y3lf0fUyvJaa+JETuQbZvzjfz2wZfuCsrNNLdJpdbHVuo0pW95vR5kQKNbJxz47zFZC5+yV6YMC8dHPi5XCisjfKurQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EN/ib10L; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g3cmqhd5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EN/ib10L";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g3cmqhd5"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68RFnjOB3229131
	for <phone-devel@vger.kernel.org>; Sun, 27 Sep 2026 16:33:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=kBaOyYV1iWR4jpfFBZ3VawI9
	vIbejaQgOQsY1cvSmjY=; b=EN/ib10LX8Y/+lkH0LFd8Jk09MJQN+CIC0e7m+uf
	SFjv96uGdqB/t/rKCAY44aGZobz57ViFMvRnVljBHQPa9qd1lHKiYuXvfhaqGAnH
	H92h5WAYp5cigEofp8/jBwuvtbpKRFddGeaCvseffvOiUEtKXC8uS6cPUNmPD7WF
	/BVSAi27/TO/jOfutRTKml2kn7amU4nYxvTg8i8Xa3nxxQlozuSAiYgy/sWmUAxD
	/4drmk0V+Ith/qcM7lQeW0TtVrZqZIQ/jn2l2MAZf3o0CQsKbD90B5+p+VmHrund
	F0ME9KJN4BafMYiviDoi8ZgU1f4tRmUJ33kUeWMiI1rxkQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gx64uuf80-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Sun, 27 Sep 2026 16:33:38 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93c63d960aeso161387785a.1
        for <phone-devel@vger.kernel.org>; Sun, 27 Sep 2026 09:33:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790526818; x=1791131618; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kBaOyYV1iWR4jpfFBZ3VawI9vIbejaQgOQsY1cvSmjY=;
        b=g3cmqhd5myslN0V5757uS/KwZ29tSu5wq/u4g3X9CKoKDEvEpjscVkZmnxP7WZvl11
         l9w+vWLlaUqQ4z5Ov0fW1t1Aa8os0JB3hIoH9DnPj0d9fhTHpDQZZeu+vzyiCEm7X5tc
         kfO1WiSzQkbUTO4DAYguORKrufsSprYwIaI9S4jjnmRiXYNB9HWX48cveKUfxRWMcJKa
         gF8tsLgm8BJtCWmGgiZkcPJoF8C7uTni4M8e8C9UvUKyD+bCjlfe/eE1ZYpwwcPsn/rg
         3giZsQkmfNg0M+7U/DAwNwyXnk7/MjJYTumBDDBSk1AOMG/m7M2k0qvGOEqXkxqUiZ0i
         +r5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790526818; x=1791131618;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kBaOyYV1iWR4jpfFBZ3VawI9vIbejaQgOQsY1cvSmjY=;
        b=LuKvgdogkp1Pvu4jt7ReM5tPDoa29FF4eb+2uYul3BVOVNuiw4IQMjIsqLyu3bsTWS
         rma05EWaMwLQ1zrxgcMToKqce8TjPNEJlq6tnl/7O1KHZyZTkUB36ZEHCgRxeJQd/gf9
         rDeQHTfDzX6plsKwslKxSmGSgsEMbBdOQs1DjU4NiHeb/LqKlMaPM6n1cjkZ68/BhC1a
         hiZ56h011EB3LOooc+zgw8BkNhR70FtIkqrYdqQG+2Shw165ZmlLKbykd906az9SkF8o
         Io7IzscWwINxkSmVdG/wO3+G87SXXbVblsqOTzvGibBZtCh06IPYJzszlzf41vq9gc0i
         610Q==
X-Forwarded-Encrypted: i=1; AKwUvBzTqUmq05oXhyARwjTm8tWHvdBaXnNXJ/idsmMTpzRI4So/PVv5LQUT2OTPZ6R+jilMr6EHW6baFDZ34w==@vger.kernel.org
X-Gm-Message-State: AFuF++mfDYMHEtN/35F7mwlTbj6EfL5SVBzvHhounFRJB8F+ALox6mga
	kTlBCdOBHntdYEw0OAyJLgCfPk8Crw8zJ5Z2kJt+a9baA9SoKeovvnLPqkMYqfcjDEHguhLGVvA
	iQebapO63zpujEN8veR1lQLP/k6S11uRaUJSoSNQWwX28LPgOkKDIEO8MChhiLGS7Tw==
X-Gm-Gg: AYBFou3OliFJ4l1wMY9nBaKkey5vOPF/vykreYRlYjaNUBD1uZun7qKgFf8u/FsXst/
	YiWxaCoHYQhFBOEiV/flaq+XIw3+E3GeeJLI76yO+TYFsuADAa25RHvnVQRBI5BkBccSIp3cTyR
	w7LhQ6y/7S5e1t/os4yyMIHbW2cXOPUQdTAs4S+t335eKjSKf5oaM9UUgN0mu6joQPJ6APQXDoV
	Zb8HzzGvBHGNVXu1dllzgi9Ey1KCUExhwAJRQO9yQsmwX/nbKgOhqK1AZvPb8TxTJJnshcqvGvS
	jci0d+ftKIn9+RA4q3aBRz112305tXMtNEC6JZM/WgYspXgv/5NGDRcevdNslCVOBDngMMMdoOo
	djK6OBqyUthf9PGus529P7ExLyiv81VdUsi6d+czfkGGzeG32dLXnyrwyeCXMaW7fceimIldEPK
	xhJxJvcnoorlFE
X-Received: by 2002:a05:620a:8001:b0:93c:735c:2477 with SMTP id af79cd13be357-93c735c28b2mr277172085a.21.1790526818120;
        Sun, 27 Sep 2026 09:33:38 -0700 (PDT)
X-Received: by 2002:a05:620a:8001:b0:93c:735c:2477 with SMTP id af79cd13be357-93c735c28b2mr277166485a.21.1790526817696;
        Sun, 27 Sep 2026 09:33:37 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8e6ae622bsm1929439e87.16.2026.09.27.09.33.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 09:33:36 -0700 (PDT)
Date: Sun, 27 Sep 2026 19:33:34 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: David Heidelberg <david@ixit.cz>
Cc: Alexey Minnekhanov <alexeymin@minlexx.ru>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
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
Subject: Re: [PATCH RFC 00/12] Qualcomm Type-C support for 1st generation
Message-ID: <zb3s4fmwx7vu3kcqigensacbgdqoaqnipfn4ntx4dh7ahrfr42@hvdw36dqb3qn>
References: <20260926-typec-v1-0-31adc19f32c6@ixit.cz>
 <voc4ie6fcegr3thk5n6dib4pkdxmracch4hhgjdih6pxrq2bfm@lq7mx4flowqk>
 <f85cdfb7-b797-4b4b-9937-670c6dfe52c3@ixit.cz>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f85cdfb7-b797-4b4b-9937-670c6dfe52c3@ixit.cz>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI3MDA2NSBTYWx0ZWRfXyKuP71eelJZL
 mOqstQrP8tIpGAnA0MjmL3BLUG7I30Vj2l/Q9Fjm3zqN9HJDwpnTSTS62G8Ujp3jJ1WifFZQcr8
 zVzoc/eG2hAOk5cI4UWU0BQ7onKw04c=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI3MDA2NSBTYWx0ZWRfX5RGzzFTXvbgK
 oiiiF1KsyUhIVvo2PfPCxJz9ucjK98xxpYzAgJqotb94hNU6kMCNeIhIQzNqRS24wGCz0EJ1HP2
 AqIVVaRY43sZvAsRPS3ZnFexwWjLEnyol/4mUHwPCvtYsfc3JU+tVUuvacKRlBWrCAbD9M7UkOX
 BLn6p3tk8svSuMOse3rZidBuekFbXo+p/Hz+GzdG2hGkVNVoBqpMXtbUPQV4xppFwtc228iYcMP
 orMPBQq0pA7wT4kClJ80AlTIDCkxFTxSATQyrjdtuhZ1Hhi8fu9g2uIJW3myjr3qG7ZkIvJVxO3
 k07Jgad+X8f39+exnX8tVC9xpssOH7J1ZI3DBPtG9LhEMXLAXHxXKx4VMBDUIRNMd/q2YJ3gYLf
 OkbQakYIR3nGU1rp/pE6UiP2PtQFmIIGj8EoM3jfCKPBFIoDuYjurdq3Jh4fr2oh8Hn4jTP8ZfQ
 AFOF9losVzkZ84JVXfg==
X-Proofpoint-ORIG-GUID: R2KJGDONxjrq3Mt2bK9BgvFhrbkRKCu_
X-Authority-Analysis: v=2.4 cv=E6xYNqdl c=1 sm=1 tr=0 ts=6ab94562 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=Ei4b4_x7BeZEOqWOIxkA:9
 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: R2KJGDONxjrq3Mt2bK9BgvFhrbkRKCu_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-26_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 priorityscore=1501 suspectscore=0 impostorscore=0
 malwarescore=0 adultscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609270065

On Sun, Sep 27, 2026 at 05:16:28PM +0200, David Heidelberg wrote:
> On 27/09/2026 15:05, Dmitry Baryshkov wrote:
> > On Sat, Sep 26, 2026 at 02:40:19PM +0200, David Heidelberg via B4 Relay wrote:
> > > This series adds basic USB Type-C support for 1st gen devices, covering
> > > configurations that do not require VBUS power (e.g. devices using
> > > externally powered docks).
> > > 
> > > VBUS support will be added in a follow-up series after this one is merged.
> > > Supporting VBUS will likely require refactoring parts of the SMBX charger
> > > support, which is why it is not included here.
> > > 
> > > Tested with an externally powered dock station:
> > > 
> > >   - Pixel 3 / 3 XL
> > >   - SHIFT 6mq
> > >   - OnePlus 6
> > > 
> > > Tested with an additional, not-yet-included VBUS patch for non-powered
> > > devices:
> > > 
> > >   - Xiaomi Redmi Note 7
> > >   - Xiaomi Mi Pad 4
> > 
> > THis is very interesting, as it will also unblock DisplayPort support on
> > devices from those generations.
> 
> Yes, DP works with some minor adjustment there and there (going to be follow-up)
> 
> > 
> > 
> > One major comment. As we see, on SMB2 PMICs parts of the Type-C
> > functionality are provided by the charger / FG device. I guess that on
> > SMB5 PMICs we will get the same problem once somebody tries to implement
> > additional charger features. Would it make sense to rework the PMIC TCPM
> > driver to be a composite driver, taking several components via the
> > existing Linux interface?
> 
> As this gets decided from the QCOM side, I'm fine with whatever suits the
> hardware best.

Bryan, as you are a maintainer of the PMIC-TCPM? Would the use of
components be fine?

-- 
With best wishes
Dmitry
