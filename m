Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C2CD1D5ABA
	for <phone-devel@vger.kernel.org>; Sun,  5 Oct 2025 22:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759703009; cv=none; b=UOxxZZ1/Y3R8ji7MT7diKhA7V7prKaVHsQHb2lx1zTsmI0/jXCMAAfs+dEeBkjz6F/5tAOnU+wHWpvnaLoOvY7rSrE3oT3bejpI6tgn53crQpPdqn/6THHWFLmPLqxwyDtgzjfjPfcogMPnTat0ee+pQwGHx05Lpah9MQtoy6Ys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759703009; c=relaxed/simple;
	bh=Z/d1cmHnIpZcYmrdaRS5TreRCAVULFhW1i/E94Fp3Wk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IoTM74A2GDfbKACgPOKitwjp5n0uJUXzVHY5hkUZ39GRP5N+uEEICfS78Uqbs57MQrlSPNBMcFLvH+mNdmDWQGzO2+Mdtc+O030MPyqOnQF4/gcF8Tb21gJCdprPeyWHXFpKEkSAwLv6/28XiK7tl1EsAqUO5MqbzDFxU2dCVrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GSyeppwx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GSyeppwx"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 595LYBfY018637
	for <phone-devel@vger.kernel.org>; Sun, 5 Oct 2025 22:23:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=HkavZTNmerI5o65w8ncgVohP
	1tuZa7qLx/+DCZ97ays=; b=GSyeppwxYtkpNvEB9CXu7VHD8FyexvjJz09BThVA
	5MPxqhXZyJSts66XXHTAxIR1bFnuhC9DZxsASNgp66jNYt0kM6qL/Gy6SQKvEEEo
	IagmU8JAAN0dm9q940Icup3xpYtcRaW72MRXDOLf/wW2l0Ejo3v3RL90taL3/BFO
	UIC5+m1OO2oec3Ed5BxYdFO02cLR/WApAA+MVl8jKA5PR+iweERhqBIos9th3Drr
	ZlOyJGcpArwWipc/xO53vlvDiZ02uxsfClYVmhkCRigoAvrGYsVy9e5LHy5EwoLp
	Xes3IC5K/wDYnhj9azlBhgUkRU7gTaggao9l9ZcX0hj3xQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49jvrhjct3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Sun, 05 Oct 2025 22:23:27 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4deb67c61caso120038461cf.2
        for <phone-devel@vger.kernel.org>; Sun, 05 Oct 2025 15:23:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759703006; x=1760307806;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HkavZTNmerI5o65w8ncgVohP1tuZa7qLx/+DCZ97ays=;
        b=bTYXVPV/kUYsP2F4I7aSjtbHyV2vmGg43ennw25ajgWg0TtdQakiWukzgh9PjNENXr
         LufvXIov688rGMpuZJLJCY/ndMZkZ1ImR9IXWR0X0JcQlQbpLaFoutMtR7wKoQNvNBO2
         2Gt/7LTpaKuOPGYG/uqYwz+6tNfeTLeXNxDIzdwXNXCg/hxIdqxIY//BbrahpjtqKGYs
         h9E5lk3I+9WyYt1aPPtnor576EDgcWMbkbdVvwde1gAxZnrJgerHsXR+mgQjf7gVgBYT
         Zq3PxXRszm5+f9hLr9ujCdHJZSYp0TB1GQ53ldEaikwxakL37wyeGdLGV4oWOGacd85i
         M+cQ==
X-Forwarded-Encrypted: i=1; AJvYcCV/5DYGEhfaAVg1EiskYhgNUDFhlydVQPLqt9wniRzGVA7Na0xtdNvc9fqxJeIrHN/m0zMKogJ2oqx+fg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxwf61nKp/dFz/L0vculRtZENrJ28u4Q6IbejsiBjwBzNFso3qw
	hPKSwEckEBLnbWWnBbVThPFW7IasNrq9j5hdvOb33LgjkafQtkuVKbaaP8KCBZ6dpwTySpHyx76
	1oy4O2xqs4N2PNhGlFhzotz22lEauL9MqUIlkfJQlZ6XHqzeV73ZYn968CHN7oxKk7g==
X-Gm-Gg: ASbGncvubEGjbHJWHMYdE4UjpN46TPckwFxDgnya86b8LpaLjJ/N3DHp5xPuhCSqXtO
	PErpyaoCv+zmPbMSJouA27+GisJNB+2J1KbtzgbXIy3G2V7TIAAuoqLlvLPYbYxMM79AHT0UFva
	44HInU6F47AVaou00SwNz7zjv49TRF4UB+hHUQPgIs8wuhJinWxboT1dA8d6HlGqhm/umZKxdVA
	byHe0mzSg5Pt9w1v30qb1b/Ly7ohJDgzUy65JS+AdTTPuzv4sZ7nbkd+QnTO3lWZeMUVJeV2f9f
	zRTfaGjkF/fTS1d0hGeFzcGfcy3WgsI0Bu4KrxsTo3pXInQ4C/Sr4DQnAwMlgVOHd7am5aJ3B1Q
	5FtNdYkZ2tOhPIfRiLoWD2RM1sMS94F8p0y2gRyK5VQ7PCnuTJVWDYVUlpw==
X-Received: by 2002:ac8:6f19:0:b0:4b5:781c:8841 with SMTP id d75a77b69052e-4e576ab89d5mr143936911cf.42.1759703006439;
        Sun, 05 Oct 2025 15:23:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHusGPKlhdeM3kKfumOVt6gnrGqSczS5SCraNaBCAp+0/JuOqrHjGq6QZKCt6SI0m+MD3AuKQ==
X-Received: by 2002:ac8:6f19:0:b0:4b5:781c:8841 with SMTP id d75a77b69052e-4e576ab89d5mr143936711cf.42.1759703005960;
        Sun, 05 Oct 2025 15:23:25 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-373ba444480sm37937761fa.30.2025.10.05.15.23.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Oct 2025 15:23:24 -0700 (PDT)
Date: Mon, 6 Oct 2025 01:23:21 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Chris Brown <crispybrown@gmail.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Paul Sajna <sajattack@postmarketos.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        Amir Dahan <system64fumo@protonmail.com>
Subject: Re: [PATCH v3 09/11] arm64: dts: qcom: sdm845-lg-common: Add camera
 flash
Message-ID: <gk4dxz4wavdc66xr76bwiwu6o4f2d3iyxxwnyr3onmkwhlgk4k@tlvnmzbfbzbl>
References: <20250928-judyln-dts-v3-0-b14cf9e9a928@postmarketos.org>
 <20250928-judyln-dts-v3-9-b14cf9e9a928@postmarketos.org>
 <42463474-7fba-4df3-9dbb-24140581690f@oss.qualcomm.com>
 <CABN5=wEpekmKxFCr7nBcYGSt6ZH-g+bx7Y5Nmoo=tMrorz2XBg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CABN5=wEpekmKxFCr7nBcYGSt6ZH-g+bx7Y5Nmoo=tMrorz2XBg@mail.gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAzNiBTYWx0ZWRfX6p4sg451YFwr
 jsivRavO2LMAdH+FmMprshmcM/XXXSRulPj7PHWdNlLlMSHWE6le4pJlTNJOzJsMtpuZ0OLya5u
 DpGPGuG+R4+Hfgy/34UbKcU/YfoMNjpjo95NViR7PSoP5+SG2M8LIvYhTjGFQHtDQ8erNk+uKCE
 9VLnmukluT4GvmMZu8CE+KEAH6TttcrJJHSZvbU4zsGHxhRK3swxAUZrbnpE7hYTKjLacXt1VTC
 vkGY4TVmDvAIhiS0wKaDl+L1dA6UZh3QMwSdbYwPj6KtiToWT6A+4AdXobh2NCBk0vvw8BpXQxc
 7qSch0K7IVl5MAgMaVVJggFE4hKum4yp67rDnKfu9K74/NBH29B/wdTea/MMvQ3yyZam5cQfhaD
 1Mux9sc7O/nUss9sUD7z41v+33LFpA==
X-Proofpoint-GUID: nclowuaCg-_stz_6htD2yo1Wog8fMtGS
X-Authority-Analysis: v=2.4 cv=XIQ9iAhE c=1 sm=1 tr=0 ts=68e2efdf cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8 a=4fvD49LNPrp0q1SnXk4A:9
 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: nclowuaCg-_stz_6htD2yo1Wog8fMtGS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-05_07,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 clxscore=1015 adultscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040036

On Sun, Oct 05, 2025 at 03:35:56PM -0400, Chris Brown wrote:
> 850mA looks correct for the flash, whereas the flashlight/torch should
> be 100mA based on
> https://github.com/EmanuelCN/android_kernel_lge_sdm845/blob/U/arch/arm64/boot/dts/lge/sdm845-judy/sdm845-camera/sdm845-judy-camera.dtsi
> i.e. led-max-microamp = <100000>;

Please post your answers before the question rather than at the top of
the email.

> On Wed, 1 Oct 2025 at 05:04, Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:
> >
> > On 9/29/25 7:05 AM, Paul Sajna wrote:
> > > So it can be used as a flashlight
> > >
> > > +             led-max-microamp = <850000>;
> > > +             flash-max-microamp = <850000>;
> >
> > Allowing the same current for flash (brief on/off for night photos)
> > and LED (flashlight which you normally toggle through quick settings)
> > sounds no less than suspicious
> >
> > > +             flash-max-timeout-us = <500000>;

-- 
With best wishes
Dmitry
