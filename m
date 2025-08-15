Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF5E0285C8F
	for <phone-devel@vger.kernel.org>; Fri, 15 Aug 2025 11:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755256993; cv=none; b=HJHQOJ1gDL8A6W/l1ETwzmUMFczYTfclbC5KpsmbOL6LwiAxJZBkqOuf+zuueq/IYW4btg3QT3a2tr+v1FW8iqZeeYcT+BdH6Ff+/ggNcP84W0bTTsZFU24rT9amqXeVGHNd50eTAKjV/33F7zoT1quJNrDjdevhxWMNHUfLZRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755256993; c=relaxed/simple;
	bh=Y4b9RHGk5FuTwKgZo6QSS7Z99ahbeLWA4mpKEy8knmU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RTOj/kZtE82HrH4besJCCqhhRrMkmswp1zisIcp+1ZH62kpGnCcPdub1q7AdWYMNw9oFq0Y5BblwDRTOIZT0mCp0vNJbZ+YfnOIs5hHgJGoWmTrzypHgvWhu8LJ7JsKKlRUrMIfCpKAHNlf/44PvM7KZadcGUO5xEHvisdLWQbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Wf7M3Oz0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Wf7M3Oz0"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57F9m5q8001734
	for <phone-devel@vger.kernel.org>; Fri, 15 Aug 2025 11:23:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Y4b9RHGk5FuTwKgZo6QSS7Z99ahbeLWA4mpKEy8knmU=; b=Wf7M3Oz01B4Q6QOQ
	zFZCh+sT2n9qM1t8rRLAybgFUzqaNVCrnOkoCoSoHXCUADUPZrhxHjkfioLJgPEB
	sWfWLjoYAuaqsOJCS6ClZ/iP0Y5yiRPlFmlzR/Fwla5D2xBSli3ENXZtsO8ryu07
	Z075qCeXgr0owQiEMdjIT4wI/HAl1VCpfJ0KxxEnYHMXDiycf9QkrRyWxsqRllTc
	5cFpg1C2JOz3myYcxeuHSosBcAh4NGiKJw7NDRemdFvPb0NXv2pb96eWwOj5dY5M
	uvFrOR6Z7UQ/v9CIzkcB8AdWD9krK2H1m3IFcLZGbJ0acDeAoWSKpitnAhxmiZ6e
	MW0vwA==
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com [209.85.166.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dxdvawvx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Fri, 15 Aug 2025 11:23:10 +0000 (GMT)
Received: by mail-io1-f71.google.com with SMTP id ca18e2360f4ac-88432e62d01so242541939f.3
        for <phone-devel@vger.kernel.org>; Fri, 15 Aug 2025 04:23:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755256990; x=1755861790;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y4b9RHGk5FuTwKgZo6QSS7Z99ahbeLWA4mpKEy8knmU=;
        b=mR3R4KnEng60J41N815gpOmD2WLqZRseawbfkZpGe/DBFbAWgjrzODr5pb+JPB+Q1L
         zEzEAz9A5VmLSI3H2QjEUKV+VzATGbRdsC+m1H/YVD2sQ5hYzWR6zhxM45zf16z3l+Sx
         E/hHvAoeRkmXv6eyyTCRny/9WWxa6OHuD/UbngtDyABeZHB6XA31+pR5jnhKMDIrto52
         BHYSFCR/4Y/xJGrzOi4X71rgwTCLjtezxRtNeNPRN5dtYB0brOg2Rwc4y2PdjfFL4nO3
         91gdPlnc1NPceQY47Q1TrhCZk7uoJXVRd2E5hhe4RCxE/v/yJiUiSvSjzfbqjsAfC5Gn
         4yKQ==
X-Forwarded-Encrypted: i=1; AJvYcCUafEtqOEX1eRBQNmCEE6/+zOt+1rmhsqcHRdSfpVnCGqy3tLhaQAshXKCfzsZeWjoZk3S0A7FSdIgCag==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9FDheWXAS8vzb/lQOh98YEL9ayAEQ3AuITYKTvCeu1KQekjRa
	sU5C3fyVRKrZqh0BSnndA3WOKSGqCtGpsrsgSNg+zwGfhGr/Oe7EDqdW/bJ0sFDLvWvqgW5msNA
	kfoqQUPAMggC5lGBJRMaN+IBym+HeiJH672TpH1J7IMox3KQEADRPqQHmJojb4pvCLffxIojj+h
	t048RH+uxLOOsLvkeG2iN1wwye9JthcIgZMwmvn457
X-Gm-Gg: ASbGnctXw0kvGDeaoeZ20C463ZhkHG3iyu+uC22KtiwcuyByIgk9NVm6lelrz6UDEeW
	G4pTBnRn6nZ32Kw0FytfEqWMkHAYucOdpwbFSuGzUXygedr+44PVHs6Lq+E+POo6VQ6/daJvdty
	14D05BKW5MIxBvjJkBpfybRQ==
X-Received: by 2002:a05:6602:4f86:b0:86c:f3aa:8199 with SMTP id ca18e2360f4ac-8843e495e01mr325662539f.11.1755256989742;
        Fri, 15 Aug 2025 04:23:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGZ+ruMJ4du6+6g0nP8YZAkSswv8epp8ueh0uj+5gCKOxs0IVlgGmW3dr6Fkri8yCflGk2TEH9pfq2BhwVZoJI=
X-Received: by 2002:a05:6602:4f86:b0:86c:f3aa:8199 with SMTP id
 ca18e2360f4ac-8843e495e01mr325659939f.11.1755256989397; Fri, 15 Aug 2025
 04:23:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250810-msm8953-cci-v1-0-e83f104cabfc@lucaweiss.eu>
 <20250810-msm8953-cci-v1-2-e83f104cabfc@lucaweiss.eu> <aJnefpETGJm_cuRY@shikoro>
 <f956eccec6b8ae2737b1e758b8357051@lucaweiss.eu> <aJ7wWDejA0KDarIE@shikoro>
In-Reply-To: <aJ7wWDejA0KDarIE@shikoro>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 15 Aug 2025 13:22:57 +0200
X-Gm-Features: Ac12FXyHLyjoE0VR2tgvZT9ZWKQ9V1qYGFU3UagVhwtyFYiZHmsAWnzbmBeXE0Q
Message-ID: <CAFEp6-3pZAt9557us4ihM3-ifrUVkYx+LneuORVafYQGeVyiVA@mail.gmail.com>
Subject: Re: [PATCH 2/7] i2c: qcom-cci: Add msm8953 compatible
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Luca Weiss <luca@lucaweiss.eu>
Cc: Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=IuYecK/g c=1 sm=1 tr=0 ts=689f189e cx=c_pps
 a=WjJghted8nQMc6PJgwfwjA==:117 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10
 a=LDBv8-xUAAAA:8 a=EUspDBNiAAAA:8 a=y0T5QYlTslmZlUxBBQIA:9 a=QEXdDO2ut3YA:10
 a=CtjknkDrmJZAHT7xvMyn:22 a=DZeXCJrVpAJBw65Qk4Ds:22
X-Proofpoint-ORIG-GUID: S_gDr3IWjVs0wM2rwbhjDW1h63g-BeDQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAyNSBTYWx0ZWRfX3xz+ydy9A1vX
 jV5dqbmfj3UwNyETPs9MMwN+k8iuEQRppx1ND8dPncN1K5qlVzXX1hNan44mQtru959ukoSQaJN
 KquPm+doogEYExvuReQHj0nRLniIVZ6kR8At/WWOy0qmIuw97aHPA8mDzrQsgMHXNJDKUZvl4n2
 bI8oy8jAZzpFtjOy84WKiAJ8KNhtT1Rt+9ZvAzfyqZSsahiaYPBorp7SebEOaily5ckbnCYLv40
 hayTaL4wo9IFiYmZLQTyw1njbqpcf5Zw73lOKh78CYRbNiBNqs4XuUDTtVKxaeB85GITuNm4Gxm
 OIYNj/VmnEisqpR8k0CBM03kRY0vYlBCDP2A8UC1HrCYR94fNNO1VuLtVbriHJsy+RLj/6xxzsj
 HrFU5V0K
X-Proofpoint-GUID: S_gDr3IWjVs0wM2rwbhjDW1h63g-BeDQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-15_04,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 phishscore=0 suspectscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090025

On Fri, Aug 15, 2025 at 10:31=E2=80=AFAM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> Hi Luca,
>
> > I'm also not sure what these parameters depend on, if it's CCI HW versi=
on,
> > or
> > something else. So naming it after the SoC should be a safer bet. Also =
the
> > msm8974-cci was only named 'v1.5' because it's an inbetween mix of the =
v1
> > and
> > v2 that were already upstream so arguably that one shouldn't have been
> > called
> > v1.5 in the first place either.

That's correct, this is a local version, not matching HW IP version.
The config depends both on the HW version and the CCI core clock.
As our timings are statically configured we should also ensure that
the CCI clock is correct...

> >
> > Let me know what you think. Maybe also someone from Qualcomm/Linaro can=
 jump
> > in and share their thoughts, if someone knows more what these params de=
pend
> > on.

That's fair enough.

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
